import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:girman/core/theme.dart';
import 'package:girman/features/home/presentation/widgets/navigate_web_view.dart';
import 'package:url_launcher/url_launcher.dart';

enum DropDownOptions {
  // website('https://www.girmantech.com/'),
  // linkedin('https://www.linkedin.com/company/girmantech/'),
  // contact('contact@girmantech.com');

  website('Website'),
  linkedin('Linkedin'),
  contact('Contact');

  final String value;

  const DropDownOptions(this.value);
}

class GirmanDropDownButton extends StatelessWidget {
  GirmanDropDownButton({super.key});

  final List<DropDownOptions> options = [
    DropDownOptions.website,
    DropDownOptions.linkedin,
    DropDownOptions.contact
  ];

  final String website = 'https://www.girmantech.com/';
  final String linkedin = 'https://www.linkedin.com/company/girmantech/';
  final String contact = 'contact@girmantech.com';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<DropDownOptions>(
      icon: Container(
            margin: const EdgeInsets.symmetric(
                horizontal: PaddingUtils.paddingSmall),
            child: Image.asset(
              'assets/images/menu.png',
              fit: BoxFit.fitWidth,
            ),
          ),
      items: options
          .map<DropdownMenuItem<DropDownOptions>>((DropDownOptions value) {
        return DropdownMenuItem<DropDownOptions>(
          value: value,
          child: Text(value.value),
        );
      }).toList(),
      onChanged: (DropDownOptions? value) {
        switch (value) {
          case DropDownOptions.website:
            navigateToURL(context, website, 'Website');
          case DropDownOptions.linkedin:
            navigateToURL(context, linkedin, 'Linkedin');
            break;
          case DropDownOptions.contact:
            launchEmailApp();
            break;
          default:
            break;
        }
      },
    );
  }

  void navigateToURL(BuildContext context, String url, String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NavigateWebView(url: url, title: title,);
    }));
  }

  void launchEmailApp() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: contact, // Replace with the email you want to prefill
      query: '', // Add subject and body if needed
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      await launchUrl(emailLaunchUri);
      log('Could not launch $emailLaunchUri');
    }
  }
}
