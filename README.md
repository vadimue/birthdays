# birthdays

1. How to install and run the project.
- Please clone this repo, and wait until SPM downloads all dependencies, and run the project.

2. Reasoning behind your technical choices.
- I selected a MVP as an architecture pattern for this project because it provides a trade-off between readability and clean code. It's possible to extend the functionality of app without growing view controller ot other classes.
- Table view data source + delegate are extracted to separate file
- View is being kept in a separate file, view controller is almost empty in this case
- View is being created via code with a 3rd party lib SnapKit, just syntaxis sugar. 
- Network layer is being built as a separate service
- Business logic (partially) was covered by unit tests

3. Describe any trade-offs you needed to make and your reasoning.
- You might think it's a lot of code for a such simple project, but there is a huge ability to extend a codebase together with a good ability to maintain it.
- Network layer is really simple, need to build some core things while adding new requests.
- Navigation in SceneDelegate
- UI simplifications (system font instead of custom font from Figma)
- More unit tests

4. Point out anything you might do differently if you had more time.
- I would like to build a network layer with GraphQL and Apollo framework, as I get used to work with Apollo, but I wasn't able to access GraphQL query, I've written to your email about this issue.
- I would like to build a routing layer with Coordinator/Router pattern
- Localization
- Add some more helpful extensions

5. Contact details
- https://github.com/vadimue/
- https://www.linkedin.com/in/vadym-brusko-b47707ab/
