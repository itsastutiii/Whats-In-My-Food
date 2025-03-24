import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  List<String> selectedAllergies = [];
  List<String> selectedHealthConcerns = [];
  String? selectedGoal;
  String? selectedPeople;
  String otherAllergy = '';
  String otherHealthConcern = '';
  String? selectedGender;
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String? selectedActivityLevel;

  // Method to handle allergy selection
  void _onAllergySelected(String value) {
    setState(() {
      if (selectedAllergies.contains(value)) {
        selectedAllergies.remove(value);
        if (value == 'Other (please specify)') {
          otherAllergy = ''; // Clear "Other" text when unchecked
        }
      } else {
        selectedAllergies.add(value);
        if (value == 'Other (please specify)') {
          otherAllergy = ''; // Ensure the "Other" field is cleared
        }
      }
    });
  }

  // Method to handle health concern selection
  void _onHealthConcernSelected(String value) {
    setState(() {
      if (selectedHealthConcerns.contains(value)) {
        selectedHealthConcerns.remove(value);
        if (value == 'Other (please specify)') {
          otherHealthConcern = ''; // Clear "Other" text when unchecked
        }
      } else {
        selectedHealthConcerns.add(value);
        if (value == 'Other (please specify)') {
          otherHealthConcern = ''; // Ensure the "Other" field is cleared
        }
      }
    });
  }

  // Method to handle radio selection for goals and number of people
  void _onRadioSelected(String? value, String type) {
    setState(() {
      if (type == "goal") {
        selectedGoal = value;
      } else if (type == "people") {
        selectedPeople = value;
      } else if (type == "gender") {
        selectedGender = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(
                "assets/bg2.png",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                      child: Text("Image not found or loading error."));
                },
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection(
                  title: "Welcome to What's In My Food!",
                  subtitle:
                      "Let's get you started towards a healthier life! 🥗",
                ),
                _buildTextFieldSection(
                    "What should we call you?", "Enter your name"),
                _buildRadioSection("What gender do you identify with?",
                    ["Male", "Female", "Other"], "gender"),
                _buildTextFieldSection("What is your age?", "Enter your age",
                    controller: ageController, inputType: TextInputType.number),
                _buildHeightAndWeightSection(),
                _buildDropdownSection("What is your activity level?",
                    ['Low', 'Medium', 'High'], "activity level"),
                _buildCheckboxSection(
                    "Can you tell us about any allergies you may have?",
                    [
                      "Peanuts",
                      "Shellfish",
                      "Milk",
                      "Eggs",
                      "Wheat",
                      "Other (please specify)"
                    ],
                    selectedAllergies),
                _buildCheckboxSection(
                    "What are some health issues that concern you?",
                    [
                      "Heart Disease",
                      "Diabetes",
                      "High Blood Pressure",
                      "Obesity",
                      "PCOD/PCOS",
                      "Other (please specify)"
                    ],
                    selectedHealthConcerns),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Submit survey data
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 60), // Elongated button
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // Rounded corners
                        side: const BorderSide(
                            color: Colors.black, width: 2), // Black outline
                      ),
                      shadowColor: Colors.transparent, // Removed shadow
                      elevation: 0, // No shadow elevation
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Text color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required String subtitle}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black26)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldSection(String label, String hintText,
      {TextEditingController? controller,
      TextInputType inputType = TextInputType.text}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black26)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              fillColor: Colors.white.withOpacity(0.8),
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            keyboardType: inputType,
          ),
        ],
      ),
    );
  }

  Widget _buildRadioSection(
      String label, List<String> options, String groupValue) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black26)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Column(
            children: options.map((option) {
              return Row(
                children: [
                  Radio<String>(
                    value: option,
                    groupValue: selectedGender,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGender = newValue;
                      });
                    },
                  ),
                  Text(option),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeightAndWeightSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black26)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "What is your height?",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: heightController,
                  decoration: InputDecoration(
                    hintText: "Feet",
                    fillColor: Colors.white.withOpacity(0.8),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                    hintText: "Weight (kg)",
                    fillColor: Colors.white.withOpacity(0.8),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownSection(
      String label, List<String> options, String groupValue) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black26)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          DropdownButton<String>(
            value: selectedActivityLevel,
            hint: const Text("Select activity level"),
            onChanged: (String? newValue) {
              setState(() {
                selectedActivityLevel = newValue;
              });
            },
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxSection(
      String label, List<String> options, List<String> selectedValues) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black26)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Column(
            children: options.map((option) {
              return _buildCheckBoxOption(option, selectedValues);
            }).toList(),
          ),
          if (selectedValues.contains('Other (please specify)'))
            TextField(
              onChanged: (value) {
                setState(() {
                  otherHealthConcern = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Please specify",
                fillColor: Colors.white.withOpacity(0.8),
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCheckBoxOption(String value, List<String> selectedValues) {
    return Row(
      children: [
        Checkbox(
          value: selectedValues.contains(value),
          onChanged: (bool? isSelected) {
            setState(() {
              isSelected == true
                  ? selectedValues.add(value)
                  : selectedValues.remove(value);
            });
          },
        ),
        Text(value),
      ],
    );
  }
}
