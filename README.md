# etisalat

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

Application how to use etisalat payment , which doesn't provide plugin for mobile application.
This plugin which contains android and ios (native) api call for etisalat registration, transaction , finalization api built in. 
This Flutter Application which demonstrates the user native api call of etisalat and usage of it response.
Here we are using webview to load the payment gate. on successful payment we are updating payment status. 
Same can be used in scenario:
1. Registration api -> which is used to register the payment and get payment url. 
2. After resgistration api success response we can webview with payment url which will use etisalat payment gateway screen. 
3. In webview, listen for callback url, which is mentioned in the registration input. 
4. on callback url change - call finalization api which is used to detect money .
5. According to the response finalization api we can display error screen(error message) or success screen(success message).


Usage of this plugin is to avoid writing native api call in the application.
[For more information](https://www.etisalat.ae/en/index.jsp)
 and
[Api Documentation](https://github.com/ktrunks/etisalat/blob/master/EPG%20REST%20Integration%20V1.7%20(2).pdf)


For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

