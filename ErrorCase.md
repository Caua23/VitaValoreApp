# Common Errors

## Code All Red and Full of Errors?

- Open the [pubspec.yaml](./pubspec.yaml) file and press `Ctrl + S` to save it. This will correctly import all dependencies.




In case of an error like:

```
    ../../AppData/Local/Pub/Cache/hosted/pub.dev/fancy_bottom_navigation-0.3.3/lib/fancy_bottom_navigation.dart:111:7: Error: No named        
parameter with the name 'overflow'.
      overflow: Overflow.visible,
      ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/widgets/basic.dart:3876:9: Context: Found this candidate, but the arguments don't match.
  const Stack({
        ^^^^^

```

Follow the steps below to fix the issue:

## Step 1: Access the Package File

1. Navigate to the directory where the package is installed:
C:\Users\[YourName]\AppData\Local\Pub\Cache\hosted\pub.dev\fancy_bottom_navigation-0.3.3\lib\

2. From lines 110 to 120:
Replace the line: `overflow: Overflow.visible,`
with: `clipBehavior: Clip.none,`

3. Go back one folder and delete the files:
.gitignore pubspec.lock

--- 
