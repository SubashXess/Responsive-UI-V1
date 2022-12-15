// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../providers/checkbox_provider.dart';
import '../providers/hover_provider.dart';
import '../widgets/textform_widget.dart';
import 'components/introside.dart';

class DesktopBody extends StatefulWidget {
  const DesktopBody({super.key});

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late FocusNode _emailNode;
  late FocusNode _passwordNode;

  bool _isPasswordVisible = true;
  bool _isLoading = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailNode = FocusNode();
    _passwordNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('reload');
    print(_isPasswordVisible);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: size.height,
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const IntroSide(),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              constraints:
                                  BoxConstraints(maxWidth: size.width / 3.8),
                              // clipBehavior: Clip.antiAliasWithSaveLayer,
                              // decoration: BoxDecoration(
                              //   color: Colors.white,
                              //   borderRadius: BorderRadius.circular(16.0),
                              //   boxShadow: [
                              //     BoxShadow(
                              //       color: Colors.black.withOpacity(0.04),
                              //       spreadRadius: 5.0,
                              //       blurRadius: 12.0,
                              //     )
                              //   ],
                              // ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Welcome back',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 6.0),
                                    const Text(
                                      'Welcome back! Please enter your details.',
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          FormFieldWidget(
                                            label: 'Email',
                                            hints: 'Enter your email',
                                            obscureText: false,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: _emailController,
                                            node: _emailNode,
                                            prefixIcon: Icon(
                                              Icons.email_rounded,
                                              color: _emailNode.hasFocus
                                                  ? Colors.deepOrange
                                                  : Colors.grey.shade400,
                                            ),
                                            suffixIcon: null,
                                            validator: (value) {
                                              if (value!.isNotEmpty) {
                                                return null;
                                              } else {
                                                return 'Required email';
                                              }
                                            },
                                          ),
                                          const SizedBox(height: 20.0),
                                          FormFieldWidget(
                                            label: 'Password',
                                            hints: 'Enter your password',
                                            obscureText: _isPasswordVisible,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: _passwordController,
                                            node: _passwordNode,
                                            prefixIcon: Icon(
                                              Icons.lock_rounded,
                                              color: _passwordNode.hasFocus
                                                  ? Colors.deepOrange
                                                  : Colors.grey.shade400,
                                            ),
                                            suffixIcon: _passwordController
                                                    .text.isEmpty
                                                ? Container(width: 0.0)
                                                : InkWell(
                                                    highlightColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    splashColor:
                                                        Colors.transparent,
                                                    onTap: _toggle,
                                                    child: Icon(
                                                      _isPasswordVisible
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                      color: _isPasswordVisible
                                                          ? Colors.grey.shade400
                                                          : Colors.deepOrange,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                            onChanged: (value) {
                                              setState(() {});
                                            },
                                            validator: (value) {
                                              if (value!.isNotEmpty) {
                                                return null;
                                              } else {
                                                return 'Required password';
                                              }
                                            },
                                          ),
                                          const SizedBox(height: 20.0),
                                          Row(
                                            children: [
                                              Consumer<CheckBoxProvider>(
                                                  builder:
                                                      (context, check, child) {
                                                return Checkbox(
                                                  checkColor: Colors.white,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  visualDensity:
                                                      const VisualDensity(
                                                          horizontal: -4.0,
                                                          vertical: -4.0),
                                                  fillColor:
                                                      MaterialStateProperty.all(
                                                          Colors.deepOrange),
                                                  value: check.isActive,
                                                  shape: const CircleBorder(),
                                                  onChanged: (bool? value) {
                                                    if (value == true) {
                                                      check.setValue(true);
                                                    } else {
                                                      check.setValue(false);
                                                    }
                                                  },
                                                );
                                              }),
                                              const SizedBox(width: 10.0),
                                              const Expanded(
                                                child: Text(
                                                  'Remember for 30 days',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              const SizedBox(width: 20.0),
                                              Consumer<TextHoverProvider>(
                                                  builder:
                                                      (context, hover, child) {
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  onTap: () {},
                                                  onHover: (value) {
                                                    hover.setValue(value);
                                                  },
                                                  child: Text(
                                                    'Forgot password?',
                                                    style: TextStyle(
                                                      color: hover.isHover
                                                          ? Colors.deepOrange
                                                          : Colors.deepOrange
                                                              .shade300,
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ],
                                          ),
                                          const SizedBox(height: 20.0),
                                          InkWell(
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: _isLoading
                                                ? null
                                                : () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      log('Success');
                                                      setState(() {
                                                        _isLoading = true;
                                                      });
                                                    } else {
                                                      log('Error');
                                                    }
                                                  },
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: size.width,
                                                minWidth: size.width,
                                                maxHeight: 46.0,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                color: Colors.deepOrange,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.deepOrange
                                                        .withOpacity(0.08),
                                                    blurRadius: 6.0,
                                                    spreadRadius: 0.0,
                                                  )
                                                ],
                                              ),
                                              child: _isLoading
                                                  ? Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: const [
                                                          SizedBox(
                                                            width: 18.0,
                                                            height: 18.0,
                                                            child:
                                                                CircularProgressIndicator
                                                                    .adaptive(
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                          Color>(
                                                                      Colors
                                                                          .white),
                                                            ),
                                                          ),
                                                          SizedBox(width: 16.0),
                                                          Text(
                                                            "Signing...",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : const Center(
                                                      child: Text(
                                                        "Sign in",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                          InkWell(
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {},
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: size.width,
                                                minWidth: size.width,
                                                maxHeight: 46.0,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                border: Border.all(
                                                    color: Colors.grey.shade500,
                                                    width: 0.6),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.08),
                                                    blurRadius: 4.0,
                                                    spreadRadius: 0.0,
                                                  )
                                                ],
                                              ),
                                              child: Center(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/svg/google.svg',
                                                      height: 20.0,
                                                      width: 20.0,
                                                    ),
                                                    const SizedBox(width: 10.0),
                                                    Text(
                                                      "Sign in with Google",
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: size.height * 0.030),
                                          const Text.rich(
                                            TextSpan(
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        'Don\'t have an account? '),
                                                TextSpan(
                                                  text: 'Sign up',
                                                  style: TextStyle(
                                                    color: Colors.deepOrange,
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }
}
