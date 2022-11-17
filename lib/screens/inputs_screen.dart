import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Inputs"),
      ),
      body: const SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: FormUserInfo(),
      )),
    );
  }
}

class FormUserInfo extends StatelessWidget {
  const FormUserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> userFormKey = GlobalKey<FormState>();
    final Map<String, String?> userData = {
      "name": "",
      "lastName": "",
      "email": "",
      "pass": "",
      "role": ""
    };

    return Form(
      key: userFormKey,
      child: Column(
        children: [
          CustomInputFiled(
            hintText: "Nombre",
            labelText: "Nombre del usuario",
            suffixIcon: Icons.person,
            onChange: (value) => userData["name"] = value,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          CustomInputFiled(
            hintText: "Apellido",
            labelText: "Apellido del usuario",
            suffixIcon: Icons.person,
            onChange: (value) => userData["lastName"] = value,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          CustomInputFiled(
            hintText: "Email",
            labelText: "Email del usuario",
            suffixIcon: Icons.email,
            inputType: TextInputType.emailAddress,
            onChange: (value) => userData["email"] = value,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          CustomInputFiled(
            hintText: "Contraseña",
            labelText: "Contraseña del usuario",
            suffixIcon: Icons.email,
            inputType: TextInputType.emailAddress,
            obscureText: true,
            onChange: (value) => userData["pass"] = value,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            items: const [
              DropdownMenuItem(child: Text("Admin"), value: "Admin"),
              DropdownMenuItem(child: Text("SuperUser"), value: "SuperUser"),
              DropdownMenuItem(child: Text("Developer"), value: "Developer"),
              DropdownMenuItem(
                  child: Text("Jr. Developer"), value: "Jr. Developer")
            ],
            onChanged: (value) => userData["role"] = value ?? "Admin",
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                if (userFormKey.currentState!.validate()) {
                  print(userData);
                } else {
                  print("Data invalid");
                }
              },
              child: const SizedBox(
                child: Center(child: Text("Guardar")),
                width: double.infinity,
              ))
        ],
      ),
    );
  }
}

class CustomInputFiled extends StatelessWidget {
  const CustomInputFiled({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.suffixIcon,
    this.inputType,
    this.obscureText = false,
    required this.onChange,
    this.textInputAction,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? suffixIcon;
  final TextInputType? inputType;
  final bool obscureText;
  final Function(String?) onChange;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: inputType,
      onChanged: onChange,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) return "Este campo es requerido";
      },
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon)),
      textInputAction: textInputAction,
    );
  }
}
