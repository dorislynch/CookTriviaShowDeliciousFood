
# react-native-cook-trivia-show-delicious-food

## Getting started

`$ npm install react-native-cook-trivia-show-delicious-food --save`

### Mostly automatic installation

`$ react-native link react-native-cook-trivia-show-delicious-food`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-cook-trivia-show-delicious-food` and add `RNCookTriviaShowDeliciousFood.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCookTriviaShowDeliciousFood.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNCookTriviaShowDeliciousFoodPackage;` to the imports at the top of the file
  - Add `new RNCookTriviaShowDeliciousFoodPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-cook-trivia-show-delicious-food'
  	project(':react-native-cook-trivia-show-delicious-food').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-cook-trivia-show-delicious-food/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-cook-trivia-show-delicious-food')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNCookTriviaShowDeliciousFood.sln` in `node_modules/react-native-cook-trivia-show-delicious-food/windows/RNCookTriviaShowDeliciousFood.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Cook.Trivia.Show.Delicious.Food.RNCookTriviaShowDeliciousFood;` to the usings at the top of the file
  - Add `new RNCookTriviaShowDeliciousFoodPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNCookTriviaShowDeliciousFood from 'react-native-cook-trivia-show-delicious-food';

// TODO: What to do with the module?
RNCookTriviaShowDeliciousFood;
```
  