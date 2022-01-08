import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hydrated_bloc_boilerplate/data/Model/User/user.dart';
import 'package:hydrated_bloc_boilerplate/data/Model/page_route_arguments.dart';
import 'package:hydrated_bloc_boilerplate/presentations/screens/LoginScreen/AuthBloc/auth_bloc.dart';

import 'LoginBloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, this.data}) : super(key: key);

  final PageRouteArguments? data;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [

                  FormBuilderTextField(
                    name: 'name',
                    decoration: const InputDecoration(
                      labelText:
                      'Enter name here',
                    ),
                    onChanged: (String? value){},
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: 15,),

                  FormBuilderTextField(
                    name: 'email',
                    decoration: const InputDecoration(
                      labelText:
                      'Enter email here',
                    ),
                    onChanged: (String? value){},
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: 15,),

                  FormBuilderTextField(
                    name: 'password',
                    decoration: const InputDecoration(
                      labelText:
                      'Enter password here',
                    ),
                    onChanged: (String? value){},
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: 15,),




                  BlocConsumer<LoginBloc,LoginState>(
                    listener: (context, state) {
                      if(state is LoginSuccessful){

                        context.read<AuthBloc>().add(AuthenticatedUser(user: state.user));

                        Navigator.popAndPushNamed(context, '/home',arguments: PageRouteArguments(
                          toPage: "/home",
                          fromPage: "/login",
                          data: ["data for home"],
                        ));

                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      else{
                        return MaterialButton(
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              _formKey.currentState!.save();
                              print(_formKey.currentState!.value);
                              var data = _formKey.currentState!.value;
                              final user = User(email: data["email"],name: data["name"],password: data["password"]);
                              context.read<LoginBloc>().add(GetLogin(user: user));
                            }
                          },
                          color: Colors.blue,
                          child: const Text("Login",style: TextStyle(color: Colors.white),),
                        );
                      }
                    },
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
