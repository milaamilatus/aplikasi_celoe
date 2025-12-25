import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatefulWidget {
  final String initialName;
  final String initialEmail;
  final String initialPhone;
  final String initialDob;

  const EditProfilePage({
    super.key, 
    required this.initialName,
    required this.initialEmail,
    required this.initialPhone,
    required this.initialDob,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _dobController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _emailController = TextEditingController(text: widget.initialEmail);
    _dobController = TextEditingController(text: widget.initialDob);
    _phoneController = TextEditingController(text: widget.initialPhone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFE11D48); // Rose-600
    const Color backgroundLight = Color(0xFFF8FAFC); // Slate-50

    return Scaffold(
      backgroundColor: backgroundLight,
      body: Container(
        constraints: const BoxConstraints(minHeight: 844),
        child: Column(
          children: [
            // Custom Header
            Container(
               padding: const EdgeInsets.only(top: 48, bottom: 32, left: 24, right: 24),
               decoration: const BoxDecoration(
                 gradient: LinearGradient(
                   colors: [Color(0xFFF43F5E), primaryColor], // Rose-500 to Primary
                   begin: Alignment.topLeft,
                   end: Alignment.bottomRight,
                 ),
               ),
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       IconButton(
                         icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                         onPressed: () => Navigator.pop(context),
                       ),
                       Text(
                         'Edit Profil',
                         style: GoogleFonts.poppins(
                           fontSize: 20,
                           fontWeight: FontWeight.w600,
                           color: Colors.white,
                           letterSpacing: 0.5,
                         ),
                       ),
                       IconButton(
                         icon: const Icon(Icons.close, color: Colors.white, size: 28),
                         onPressed: () => Navigator.pop(context),
                       ),
                     ],
                   ),
                   const SizedBox(height: 20),
                   // Profile Image Stack
                   Stack(
                     children: [
                       Container(
                         width: 112, // 28 * 4 = 112
                         height: 112,
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           border: Border.all(color: Colors.white, width: 4),
                           image: const DecorationImage(
                             image: NetworkImage('https://img.freepik.com/premium-photo/portrait-young-business-woman-looking-camera-smile-white-wall_33799-8833.jpg'),
                             fit: BoxFit.cover,
                           ),
                           boxShadow: [
                             BoxShadow(
                               color: Colors.black.withValues(alpha: 0.1),
                               blurRadius: 10,
                               offset: const Offset(0, 4),
                             ),
                           ],
                         ),
                       ),
                       Positioned(
                         bottom: 4,
                         right: 4,
                         child: Container(
                           padding: const EdgeInsets.all(8),
                           decoration: BoxDecoration(
                             color: const Color(0xFF1E293B), // Slate-800
                             shape: BoxShape.circle,
                             border: Border.all(color: Colors.white, width: 2),
                           ),
                           child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
            ),

            // Form Content
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                child: Container(
                  color: backgroundLight,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                    children: [
                      _buildTextField(label: 'Nama Lengkap', icon: Icons.person, controller: _nameController),
                      const SizedBox(height: 24),
                      _buildTextField(label: 'Email', icon: Icons.email, controller: _emailController, inputType: TextInputType.emailAddress),
                      const SizedBox(height: 24),
                      _buildTextField(label: 'Tanggal Lahir', icon: Icons.calendar_today, controller: _dobController, inputType: TextInputType.datetime),
                      const SizedBox(height: 24),
                      _buildTextField(label: 'Nomor Telepon', icon: Icons.phone, controller: _phoneController, inputType: TextInputType.phone),
                      const SizedBox(height: 32),
                      
                      // Save Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                             Navigator.pop(context, {
                               'name': _nameController.text,
                               'email': _emailController.text,
                               'phone': _phoneController.text,
                               'dob': _dobController.text,
                             });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                            shadowColor: primaryColor.withValues(alpha: 0.3),
                          ),
                          child: Text(
                            'Simpan Perubahan',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    TextInputType inputType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF334155), // Slate-700
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 2,
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            keyboardType: inputType,
            style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF0F172A)),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: const Color(0xFF94A3B8)), // Slate-400
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        ),
      ],
    );
  }
}
