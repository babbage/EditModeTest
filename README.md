# EditModeTest

In SwiftUI, the [editMode](https://developer.apple.com/documentation/swiftui/editmode) environment value can be toggled using an EditButton() and changes the display of a number of content types, including List. The [EditMode documentation](https://developer.apple.com/documentation/swiftui/editmode) presents a method for swapping from a TextField to a Text view when swapping in and out of Edit Mode. This approach is implemented in the viewReplacement branch in the current repo. However, this approach has the disadvantage that the animation between the Text and TextField views is not smooth, even when they contain the same text.

An alternative approach is to use TextField in both states, but conditionally set .disabled on the view when not in edit mode. This animates smoothly and previously worked as expected. However, in iOS 16 editing for the first time any SwiftUI TextField in a view causes the .active EditMode environment value to publish a change to .inactive and then rapidly again to .active. If any part of the current view is modified by the state of EditMode the view is redrawn, which causes the side effect of the active focusState to be lost/firstResponder to resign. The TextField loses focus and the keyboard disappears. This issue is only observed in iOS 16 and is not present in iOS 15.5.

This repository is a sample project to demonstrate the issue. The main branch demonstrates the issue, while the viewReplacement branch demonstrates the alternate approach that animates poorly.

A video demonstrating and narrating the issue (4m 26s) is available at: https://www.icloud.com/iclouddrive/089KynFOit6YQwsawlnvycuNw#EditMode-bug-demo

Steps to reproduce the issue:
1. In iOS 16.0, launch the sample project
2. Click on Edit to enter edit mode. The console will show editMode is set to .active
3. Click on any TextField
4. Make a single character edit to the field (either delete one character or add one). 

What is expected to happen:
When you are in edit mode, there should be no change issued to the editMode environment value when you make the first edit to the contents of a TextField.

What actually happened:
Edit mode is toggled to .inactive and back to .active again, as shown in the console output. In the sample project, because this changes the disabled state of the TextFields through an onChange(editMode) handler, the focus will resign and the keyboard will be dismissed.

This may be a bug in SwiftUI, and I have lodged feedback (FB11649400) and a technical support incident with Apple. If what is observed is the intended behaviour, I would appreciate assistance with the correct way to implement my desired behavior, so that the display views animate smoothly from one to the other, while only enabling editing of the TextField values in EditMode.
