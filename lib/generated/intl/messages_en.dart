// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "auto" : MessageLookupByLibrary.simpleMessage("auto"),
    "cancel" : MessageLookupByLibrary.simpleMessage("cancel"),
    "home" : MessageLookupByLibrary.simpleMessage("GitHub Client"),
    "language" : MessageLookupByLibrary.simpleMessage("language"),
    "login" : MessageLookupByLibrary.simpleMessage("login"),
    "logout" : MessageLookupByLibrary.simpleMessage("logout"),
    "logoutTip" : MessageLookupByLibrary.simpleMessage("Are you sure?"),
    "noDescription" : MessageLookupByLibrary.simpleMessage("nothing"),
    "password" : MessageLookupByLibrary.simpleMessage("password"),
    "passwordRequired" : MessageLookupByLibrary.simpleMessage("passwordRequired"),
    "theme" : MessageLookupByLibrary.simpleMessage("theme"),
    "title" : MessageLookupByLibrary.simpleMessage("Flutter App"),
    "userName" : MessageLookupByLibrary.simpleMessage("userName"),
    "userNameOrEmail" : MessageLookupByLibrary.simpleMessage("userNameOrEmail"),
    "userNameOrPasswordWrong" : MessageLookupByLibrary.simpleMessage("userNameOrPasswordWrong"),
    "userNameRequired" : MessageLookupByLibrary.simpleMessage("userNameRequired"),
    "yes" : MessageLookupByLibrary.simpleMessage("yes")
  };
}
