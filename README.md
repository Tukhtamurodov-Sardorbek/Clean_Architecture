# flutter_project

> TDD | Service Locator | Flavors | Local Packages | BLoC
> GetIt | Injectable

- Injectable:

             flutter pub run build_runner watch --delete-conflicting-outputs
             flutter pub run build_runner build --delete-conflicting-outputs

  🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠
  
- Create Package : flutter create --template=package PACKAGENAME

  🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉🦉

- Create Flavors [IOS]:

    <-- Need to work with XCode -->

  💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥

- Create Flavors [Android]:
    
    -> android/app/build.gradle :

         <-- Add following lines inside android{} -->
            android {
              ...
              flavorDimensions "flavor-type"
            
              productFlavors {
                prod {
                  dimension "flavor-type"
                  applicationId "com.example.flutter_project"
                  resValue "string", "app_name", "Clean Architecture"
                }
                beta {
                  dimension "flavor-type"
                  applicationId "com.example.flutter_project.beta"
                  resValue "string", "app_name", "Clean Architecture.beta"
                }
                dev {
                  dimension "flavor-type"
                  applicationId "com.example.flutter_project.dev"
                  resValue "string", "app_name", "Clean Architecture.dev"
                }
                mock {
                  dimension "flavor-type"
                  applicationId "com.example.flutter_project.mock"
                  resValue "string", "app_name", "Clean Architecture.mock"
                }
              }
            }

    -> android/app/src :
 
         <-- Create the following files -->

            android/app/src/prod 

            android/app/src/beta
            
            android/app/src/dev
            
            android/app/src/mock
         
         <-- Copy the following file "android/app/src/main/res" -->
         
         <-- Paste the copied file to each file we've created -->
    
    ![View](assets/readme/run_config.png)

  🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯

- TDD :

    ![View](assets/readme/architecture.png)

  🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡