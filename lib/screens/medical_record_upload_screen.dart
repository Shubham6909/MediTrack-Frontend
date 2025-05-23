import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';


class MedicalRecordUploadScreen extends StatefulWidget {

  const MedicalRecordUploadScreen({Key? key}) : super(key: key);

  @override
  State<MedicalRecordUploadScreen> createState() => _MedicalRecordUploadScreenState();
}

class UploadFileItem {
  String recordType;
  File file;

  UploadFileItem({required this.recordType, required this.file});
}

class _MedicalRecordUploadScreenState extends State<MedicalRecordUploadScreen> {
  String selectedRecordType = 'Prescription';

  final List<String> recordTypes = ['Prescription', 'Lab Report', 'Diagnosis', 'Medical Certificate', 'Insurance'];

  // List to hold multiple files with their record types
  List<UploadFileItem> uploadItems = [];

  File? tempSelectedFile;
  bool isUploading = false;



  // API endpoint for uploading medical records
  final String apiUrl = 'https://your-api-endpoint.com/upload'; // Replace with your API endpoint

  // Function to pick file
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      setState(() {
        tempSelectedFile = File(result.files.single.path!);
      });
    }
  }

  // Function to add the current file and record type to the list
  void addFileToList() {
    if (tempSelectedFile != null) {
      setState(() {
        uploadItems.add(UploadFileItem(
            recordType: selectedRecordType,
            file: tempSelectedFile!
        ));
        tempSelectedFile = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a file first'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Function to remove an item from the list
  void removeItem(int index) {
    setState(() {
      uploadItems.removeAt(index);
    });
  }

  // Function to upload all files to API
  Future<void> submitAllRecords() async {
    if (uploadItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add at least one file to upload'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      isUploading = true;
    });

    try {
      // Create a list to track the upload status of each file
      List<bool> uploadStatus = [];

      // Upload each file
      for (var item in uploadItems) {
        var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
        request.fields['record_type'] = item.recordType;
        request.files.add(await http.MultipartFile.fromPath(
          'file',
          item.file.path,
        ));

        var response = await request.send();
        uploadStatus.add(response.statusCode == 200);
      }

      // Check if all uploads were successful
      bool allSuccess = !uploadStatus.contains(false);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(allSuccess
                ? 'All files uploaded successfully'
                : '${uploadStatus.where((status) => status).length} of ${uploadStatus.length} files uploaded successfully'),
            backgroundColor: allSuccess ? Colors.green : Colors.orange,
          ),
        );

        if (allSuccess) {
          // Clear all files if all uploads were successful
          setState(() {
            uploadItems.clear();
          });
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isUploading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 360;

    return Scaffold(
      body: Stack(
        children: [
          // Blue background
          Container(
            height: screenSize.height * 0.15,
            width: screenSize.width,
            decoration: const BoxDecoration(
              color: Color(0xFF2196F3),
            ),
          ),

          // Curved white background
          Positioned(
            top: screenSize.height * 0.12,
            child: Container(
              height: screenSize.height,
              width: screenSize.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Column(
              children: [
                // App bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        'MediTrack',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),

                // Form content
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 80), // Extra padding at bottom for the submit button
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenSize.height * 0.05),
                          Text(
                            'Upload Medical Record',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 24 : 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.02),

                          // Subtitle
                          Text(
                            'Take a photo or upload a PDF file',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 14 : 16,
                              color: Colors.grey[600],
                            ),
                          ),

                          SizedBox(height: screenSize.height * 0.04),

                          // Record Type field
                          _buildRecordTypeField('Record Type'),
                          SizedBox(height: screenSize.height * 0.03),

                          // Upload button
                          _buildUploadButton(),
                          SizedBox(height: screenSize.height * 0.02),

                          // Add One Button
                          _buildAddOneButton(),
                          SizedBox(height: screenSize.height * 0.03),

                          // Selected file info
                          if (tempSelectedFile != null)
                            _buildTempFileInfo(),

                          SizedBox(height: screenSize.height * 0.03),

                          // List of files to be uploaded
                          if (uploadItems.isNotEmpty)
                            _buildFileList(),

                          SizedBox(height: screenSize.height * 0.04),

                          // Submit button
                          _buildSubmitButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Loading overlay
          if (isUploading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRecordTypeField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFF5FAFF),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                value: selectedRecordType,
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                  size: 18,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => selectedRecordType = value);
                  }
                },
                items: recordTypes
                    .map(
                      (value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadButton() {
    return GestureDetector(
      onTap: isUploading ? null : pickFile,
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: const Color(0xFFF5FAFF),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: tempSelectedFile != null ? const Color(0xFF2196F3) : Colors.grey.shade200,
            style: BorderStyle.solid,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              tempSelectedFile != null ? Icons.check_circle : Icons.cloud_upload_outlined,
              size: 40,
              color: const Color(0xFF2196F3),
            ),
            const SizedBox(height: 12),
            Text(
              tempSelectedFile != null ? 'File selected' : 'Tap to upload file',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'PDF, JPG, PNG files supported',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddOneButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: isUploading || tempSelectedFile == null ? null : addFileToList,
        icon: const Icon(Icons.add_circle_outline),
        label: const Text("Add One"),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2196F3),
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey.shade300,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildTempFileInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5FAFF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF2196F3), width: 1.5),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.insert_drive_file,
              color: Color(0xFF2196F3),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selected File',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  tempSelectedFile!.path.split('/').last,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                // Show file path for better visibility
                const SizedBox(height: 4),
                Text(
                  'Path: ${tempSelectedFile!.path}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                    fontStyle: FontStyle.italic,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.red,
              size: 20,
            ),
            onPressed: () => setState(() => tempSelectedFile = null),
          ),
        ],
      ),
    );
  }

  Widget _buildFileList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Files to Upload',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: uploadItems.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5FAFF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getFileIcon(uploadItems[index].file.path),
                      color: const Color(0xFF2196F3),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          uploadItems[index].recordType,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          uploadItems[index].file.path.split('/').last,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Show truncated file path for better visibility
                        const SizedBox(height: 2),
                        Text(
                          _truncatePath(uploadItems[index].file.path),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 20,
                    ),
                    onPressed: () => removeItem(index),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isUploading || uploadItems.isEmpty ? null : submitAllRecords,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2196F3),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBackgroundColor: Colors.grey.shade300,
        ),
        child: isUploading
            ? const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        )
            : Text(
          'Submit ${uploadItems.isNotEmpty ? "(${uploadItems.length})" : ""}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // Helper method to get appropriate icon based on file extension
  IconData _getFileIcon(String path) {
    final extension = path.split('.').last.toLowerCase();

    if (extension == 'pdf') {
      return Icons.picture_as_pdf;
    } else if (['jpg', 'jpeg', 'png'].contains(extension)) {
      return Icons.image;
    }

    return Icons.insert_drive_file;
  }

  // Helper method to truncate file path for display
  String _truncatePath(String path) {
    if (path.length <= 40) return path;

    final fileName = path.split('/').last;
    final directory = path.substring(0, path.length - fileName.length);

    if (directory.length <= 20) return path;

    return '...${directory.substring(directory.length - 20)}$fileName';
  }
}