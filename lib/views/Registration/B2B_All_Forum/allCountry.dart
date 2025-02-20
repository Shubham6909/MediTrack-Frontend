import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'flagImagePage.dart';

class Allcountry extends StatefulWidget {
  final Map<String, dynamic>? loginData;
  final String token;

  const Allcountry({
    Key? key,
    this.loginData,
    required this.token,
  }) : super(key: key);

  @override
  _AllcountryState createState() => _AllcountryState();
}

class _AllcountryState extends State<Allcountry> {
  List<Map<String, dynamic>> countries = [];
  List<Map<String, dynamic>> filteredCountries = [];
  bool isLoading = true;
  int currentPage = 1;
  final int perPage = 6;
  TextEditingController searchController = TextEditingController();
  String? selectedCountry;

  bool showDetails = false;
  String? selectedFlagUrl;

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    final String apiUrl = 'https://e-platapi.aecci.org.in/api/v2/b2b/getParticipateCountriesDetails/';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer ${widget.token}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('data')) {
          setState(() {
            countries = List<Map<String, dynamic>>.from(data['data']);
            filteredCountries = List.from(countries);
            isLoading = false;
          });
        }
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (error) {
      print('Error fetching countries: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  void filterCountries(String query) {
    setState(() {
      filteredCountries = countries
          .where((country) => country['country'].toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
      currentPage = 1;
    });
  }

  String? getFlagUrl(String countryName) {
    String? isoCode = countryToISOCode[countryName];
    if (isoCode == null) {
      print('No ISO code found for: $countryName');
      return null;
    }
    return 'https://flagcdn.com/w320/${isoCode.toLowerCase()}.png';
  }

  List<Map<String, dynamic>> getPaginatedCountries() {
    int startIndex = (currentPage - 1) * perPage;
    int endIndex = startIndex + perPage;
    return filteredCountries.sublist(startIndex, endIndex.clamp(0, filteredCountries.length));
  }

  Widget buildFlagImage(String? flagUrl) {
    return Container(
      height: 60,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: flagUrl != null
          ? ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(
          flagUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            print('Error loading flag: $error');
            return Icon(Icons.flag_outlined, size: 40, color: Colors.grey);
          },
        ),
      )
          : Icon(Icons.flag_outlined, size: 40, color: Colors.grey),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   int totalPages = (filteredCountries.length / perPage).ceil();
  //
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Countries'),
  //       backgroundColor: Colors.white,
  //       foregroundColor: Colors.black,
  //       elevation: 0,
  //     ),
  //     backgroundColor: Colors.grey.shade100,
  //     body: isLoading
  //         ? const Center(child: CircularProgressIndicator())
  //         : Column(
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.all(16),
  //           color: Colors.white,
  //           child: Row(
  //             children: [
  //               Expanded(
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     border: Border.all(color: Colors.grey.shade300),
  //                     borderRadius: BorderRadius.circular(8),
  //                   ),
  //                   child: TextField(
  //                     controller: searchController,
  //                     onChanged: filterCountries,
  //                     decoration: InputDecoration(
  //                       hintText: 'Search countries...',
  //                       prefixIcon: Icon(Icons.search, color: Colors.grey),
  //                       border: InputBorder.none,
  //                       contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(width: 16),
  //               Container(
  //                 decoration: BoxDecoration(
  //                   border: Border.all(color: Colors.grey.shade300),
  //                   borderRadius: BorderRadius.circular(8),
  //                 ),
  //                 padding: EdgeInsets.symmetric(horizontal: 12),
  //                 child: DropdownButton<String>(
  //                   value: selectedCountry,
  //                   hint: Text('Select a country'),
  //                   underline: SizedBox(),
  //                   items: countries.map((country) {
  //                     return DropdownMenuItem<String>(
  //                       value: country['country'],
  //                       child: Text(country['country']),
  //                     );
  //                   }).toList(),
  //                   onChanged: (value) {
  //                     setState(() {
  //                       selectedCountry = value;
  //                       if (value != null) {
  //                         filteredCountries = countries.where((c) => c['country'] == value).toList();
  //                       } else {
  //                         filteredCountries = List.from(countries);
  //                       }
  //                       currentPage = 1;
  //                     });
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Expanded(
  //           child: GridView.builder(
  //             padding: EdgeInsets.all(16),
  //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
  //               childAspectRatio: 1,
  //               crossAxisSpacing: 16,
  //               mainAxisSpacing: 16,
  //             ),
  //             itemCount: getPaginatedCountries().length,
  //             itemBuilder: (context, index) {
  //               var country = getPaginatedCountries()[index];
  //               String countryName = country['country'] ?? 'Unknown';
  //               String? flagUrl = getFlagUrl(countryName);
  //
  //               return Container(
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(8),
  //                   border: Border.all(color: Colors.grey.shade200),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.black.withOpacity(0.05),
  //                       blurRadius: 4,
  //                       offset: Offset(0, 2),
  //                     ),
  //                   ],
  //                 ),
  //                 child: Material(
  //                   color: Colors.transparent,
  //                   child: InkWell(
  //                     onTap: () {
  //                       if (flagUrl != null) {
  //                         Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                             builder: (context) => CountryDetailsPage(flagUrl: flagUrl, token: widget.token),
  //                           ),
  //                         );
  //
  //                       }
  //                     },
  //                     borderRadius: BorderRadius.circular(8),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         buildFlagImage(flagUrl),
  //                         SizedBox(height: 12),
  //                         Padding(
  //                           padding: EdgeInsets.symmetric(horizontal: 8),
  //                           child: Text(
  //                             countryName,
  //                             style: TextStyle(
  //                               fontSize: 14,
  //                               fontWeight: FontWeight.bold,
  //                             ),
  //                             textAlign: TextAlign.center,
  //                             maxLines: 2,
  //                             overflow: TextOverflow.ellipsis,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //         if (filteredCountries.length > perPage)
  //           Container(
  //             padding: EdgeInsets.all(16),
  //             color: Colors.white,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 ElevatedButton(
  //                   onPressed: currentPage > 1
  //                       ? () {
  //                     setState(() {
  //                       currentPage--;
  //                     });
  //                   }
  //                       : null,
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: Color(0xFF1748F8),
  //                     foregroundColor: Colors.white,
  //                     padding: EdgeInsets.symmetric(horizontal: 16),
  //                   ),
  //                   child: Text('Previous'),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.symmetric(horizontal: 20),
  //                   child: Text(
  //                     'Page $currentPage of $totalPages',
  //                     style: TextStyle(fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //                 ElevatedButton(
  //                   onPressed: currentPage < totalPages
  //                       ? () {
  //                     setState(() {
  //                       currentPage++;
  //                     });
  //                   }
  //                       : null,
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: Color(0xFF1748F8),
  //                     foregroundColor: Colors.white,
  //                     padding: EdgeInsets.symmetric(horizontal: 16),
  //                   ),
  //                   child: Text('Next'),
  //                 ),
  //               ],
  //             ),
  //           ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    int totalPages = (filteredCountries.length / perPage).ceil();

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Countries'),
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      //   elevation: 0,
      //   actions: [
      //     if (showDetails)
      //       IconButton(
      //         icon: Icon(Icons.close),
      //         onPressed: () {
      //           setState(() {
      //             showDetails = false;
      //             selectedFlagUrl = null;
      //           });
      //         },
      //       ),
      //   ],
      // ),
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Countries Overview',
            style: TextStyle(
              color: Color(0xFF1748F8),
              fontSize: 18,
              height: 1.2,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF1748F8),
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Color(0xFF1748F8)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.lightbulb_outline, color: Color(0xFF1748F8)),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          // Search and filter container
          if (!showDetails)
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: filterCountries,
                        decoration: InputDecoration(
                          hintText: 'Search countries...',
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: DropdownButton<String>(
                      value: selectedCountry,
                      hint: Text('Select a country'),
                      underline: SizedBox(),
                      items: countries.map((country) {
                        return DropdownMenuItem<String>(
                          value: country['country'],
                          child: Text(country['country']),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCountry = value;
                          if (value != null) {
                            filteredCountries = countries.where((c) => c['country'] == value).toList();
                          } else {
                            filteredCountries = List.from(countries);
                          }
                          currentPage = 1;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: showDetails
                ? CountryDetailsPage(
              flagUrl: selectedFlagUrl!,
              loginData: widget.loginData,
              token: widget.token,
            )
                : GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: getPaginatedCountries().length,
              itemBuilder: (context, index) {
                var country = getPaginatedCountries()[index];
                String countryName = country['country'] ?? 'Unknown';
                String? flagUrl = getFlagUrl(countryName);

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        if (flagUrl != null) {
                          setState(() {
                            showDetails = true;
                            selectedFlagUrl = flagUrl;
                          });
                        }
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildFlagImage(flagUrl),
                          SizedBox(height: 12),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              countryName,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Pagination container
          if (!showDetails && filteredCountries.length > perPage)
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: currentPage > 1
                        ? () {
                      setState(() {
                        currentPage--;
                      });
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1748F8),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: Text('Previous'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Page $currentPage of $totalPages',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: currentPage < totalPages
                        ? () {
                      setState(() {
                        currentPage++;
                      });
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1748F8),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: Text('Next'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }


  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}


final Map<String, String> countryToISOCode = {
  'Afghanistan': 'af',
  'Albania': 'al',
  'Algeria': 'dz',
  'Andorra': 'ad',
  'Angola': 'ao',
  'Argentina': 'ar',
  'Armenia': 'am',
  'Australia': 'au',
  'Austria': 'at',
  'Azerbaijan': 'az',
  'Bosnia & Herzegovina': 'ba',
  'Bahamas': 'bs',
  'Bahrain': 'bh',
  'Bangladesh': 'bd',
  'Barbados': 'bb',
  'Belarus': 'by',
  'Belgium': 'be',
  'Belize': 'bz',
  'Benin': 'bj',
  'Bhutan': 'bt',
  'Bolivia': 'bo',
  'Brazil': 'br',
  'Brunei': 'bn',
  'Bulgaria': 'bg',
  'Cambodia': 'kh',
  'Cameroon': 'cm',
  'Canada': 'ca',
  'Chad': 'td',
  'Chile': 'cl',
  'China': 'cn',
  'Colombia': 'co',
  'Congo': 'cg',
  'Costa Rica': 'cr',
  'Croatia': 'hr',
  'Cuba': 'cu',
  'Cyprus': 'cy',
  'Czech Republic': 'cz',
  'Denmark': 'dk',
  'Ecuador': 'ec',
  'Egypt': 'eg',
  'Estonia': 'ee',
  'Ethiopia': 'et',
  'Fiji': 'fj',
  'Finland': 'fi',
  'France': 'fr',
  'Georgia': 'ge',
  'Germany': 'de',
  'Ghana': 'gh',
  'Greece': 'gr',
  'Greenland': 'gl',
  'Guatemala': 'gt',
  'Guinea': 'gn',
  'Haiti': 'ht',
  'Honduras': 'hn',
  'Hong Kong': 'hk',
  'Hungary': 'hu',
  'Iceland': 'is',
  'India': 'in',
  'Indonesia': 'id',
  'Iran': 'ir',
  'Iraq': 'iq',
  'Ireland': 'ie',
  'Israel': 'il',
  'Italy': 'it',
  'Jamaica': 'jm',
  'Japan': 'jp',
  'Jordan': 'jo',
  'Kazakhstan': 'kz',
  'Kenya': 'ke',
  'Kuwait': 'kw',
  'Kyrgyzstan': 'kg',
  'Laos': 'la',
  'Latvia': 'lv',
  'Lebanon': 'lb',
  'Libya': 'ly',
  'Liechtenstein': 'li',
  'Lithuania': 'lt',
  'Luxembourg': 'lu',
  'Madagascar': 'mg',
  'Malaysia': 'my',
  'Maldives': 'mv',
  'Maxico': 'mx',
  'Mali': 'ml',
  'Malta': 'mt',
  'Mexico': 'mx',
  'Moldova': 'md',
  'Monaco': 'mc',
  'Mongolia': 'mn',
  'Montenegro': 'me',
  'Morocco': 'ma',
  'Myanmar': 'mm',
  'Nepal': 'np',
  'Netherlands': 'nl',
  'New Zealand': 'nz',
  'Nicaragua': 'ni',
  'Nigeria': 'ng',
  'North Korea': 'kp',
  'Norway': 'no',
  'Oman': 'om',
  'Pakistan': 'pk',
  'Panama': 'pa',
  'Papua New Guinea': 'pg',
  'Paraguay': 'py',
  'Peru': 'pe',
  'Philippines': 'ph',
  'Poland': 'pl',
  'Portugal': 'pt',
  'Qatar': 'qa',
  'Romania': 'ro',
  'Russia': 'ru',
  'Rwanda': 'rw',
  'Saudi Arabia': 'sa',
  'Senegal': 'sn',
  'Serbia': 'rs',
  'Singapore': 'sg',
  'Slovakia': 'sk',
  'Slovenia': 'si',
  'Somalia': 'so',
  'South Africa': 'za',
  'South Korea': 'kr',
  'Spain': 'es',
  'Sri Lanka': 'lk',
  'Sudan': 'sd',
  'Sweden': 'se',
  'Switzerland': 'ch',
  'Syria': 'sy',
  'Taiwan': 'tw',
  'Tajikistan': 'tj',
  'Tanzania': 'tz',
  'Thailand': 'th',
  'Tunisia': 'tn',
  'Turkey': 'tr',
  'Turkmenistan': 'tm',
  'Uganda': 'ug',
  'Ukraine': 'ua',
  'United Arab Emirates': 'ae',
  'United Kingdom': 'gb',
  'United States': 'us',
  'Uruguay': 'uy',
  'Uzbekistan': 'uz',
  'Vatican City': 'va',
  'Venezuela': 've',
  'Vietnam': 'vn',
  'Yemen': 'ye',
  'Zambia': 'zm',
  'Zimbabwe': 'zw',
};