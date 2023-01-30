import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/vakinha_state.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:vakinha_burguer_mobile/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends VakinhaState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(elevation: 0),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro',
                  style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark),
                ),
                const SizedBox(height: 30),
                VakinhaTextformfield(
                  label: 'Nome',
                  controller: _nameEC,
                  validator: Validatorless.required('campo obrigatorio'),
                ),
                const SizedBox(height: 30),
                VakinhaTextformfield(
                  label: 'E-mail',
                  controller: _emailEC,
                  validator: Validatorless.multiple([
                    Validatorless.email('e-mail invalido'),
                    Validatorless.required('campo obrigatorio')
                  ]),
                ),
                const SizedBox(height: 30),
                VakinhaTextformfield(
                  label: 'Senha',
                  controller: _passwordEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('campo obrigatorio'),
                    Validatorless.min(6, 'minimo 6 digitos')
                  ]),
                ),
                const SizedBox(height: 30),
                VakinhaTextformfield(
                  label: 'Confirmar Senha',
                  validator: Validatorless.multiple([
                    Validatorless.required('campo obrigatorio'),
                    Validatorless.compare(
                        _passwordEC, 'deve ser igual a senha'),
                  ]),
                ),
                const SizedBox(height: 50),
                Center(
                  child: VakinhaButton(
                    label: 'CADASTRAR',
                    width: context.width,
                    onpressed: () {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        controller.register(
                          name: _nameEC.text,
                          email: _emailEC.text,
                          password: _passwordEC.text,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
