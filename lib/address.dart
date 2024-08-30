import 'package:flutter/material.dart';
import 'checkout.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();
  String _addressType = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
        backgroundColor: Colors.orange,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange.shade700, Colors.orange.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextFormField(
                label: 'Flat / Building name / Street name',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              _buildTextFormField(
                label: 'Mobile number',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              _buildTextFormField(
                label: 'Email Address',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              _buildTextFormField(
                label: 'Full Name',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              _buildAddressTypeSelector(),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CheckoutPage()),
                    );
                    // Save the address information
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Save & Proceed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    TextInputType keyboardType = TextInputType.text,
    required FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        filled: true,
        fillColor: Colors.orange.shade50,
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  Widget _buildAddressTypeSelector() {
    return ListTile(
      title: const Text(
        'Save As',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Wrap(
        spacing: 12, // space between two icons
        children: <Widget>[
          ChoiceChip(
            label: const Text('Home'),
            selected: _addressType == 'Home',
            onSelected: (bool selected) {
              setState(() {
                _addressType = 'Home';
              });
            },
            selectedColor: Colors.orange,
            backgroundColor: Colors.orange.shade100,
            labelStyle: TextStyle(
              color: _addressType == 'Home' ? Colors.white : Colors.orange,
            ),
          ),
          ChoiceChip(
            label: const Text('Work'),
            selected: _addressType == 'Work',
            onSelected: (bool selected) {
              setState(() {
                _addressType = 'Work';
              });
            },
            selectedColor: Colors.orange,
            backgroundColor: Colors.orange.shade100,
            labelStyle: TextStyle(
              color: _addressType == 'Work' ? Colors.white : Colors.orange,
            ),
          ),
          ChoiceChip(
            label: const Text('Other'),
            selected: _addressType == 'Other',
            onSelected: (bool selected) {
              setState(() {
                _addressType = 'Other';
              });
            },
            selectedColor: Colors.orange,
            backgroundColor: Colors.orange.shade100,
            labelStyle: TextStyle(
              color: _addressType == 'Other' ? Colors.white : Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
