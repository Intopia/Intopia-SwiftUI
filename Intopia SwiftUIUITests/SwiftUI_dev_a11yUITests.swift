/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import XCTest

final class SwiftUI_dev_a11yUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFakeCheckboxStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Getting started with accessibility"].tap()
        app.buttons["Checkbox start state"].tap()
        // All fake checkboxes are present in staticTexts collection
        XCTAssertTrue(app.staticTexts["Walking"].exists)
        XCTAssertTrue(app.staticTexts["Bicycle"].exists)
        XCTAssertTrue(app.staticTexts["Scooter"].exists)
        XCTAssertTrue(app.staticTexts["Public transport"].exists)
        XCTAssertTrue(app.staticTexts["Car"].exists)
        XCTAssertTrue(app.staticTexts["Other"].exists)
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testFakeCheckboxEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Getting started with accessibility"].tap()
        app.buttons["Checkbox end state"].tap()
        // Semantic checkbox is in toggles collection, not static text
        XCTAssertTrue(app.toggles["Walking"].exists)
        // Semantic checkbox has initial unchecked state
        if let temp = app.toggles["Walking"].value, let value = temp as? String {
            XCTAssertTrue(value == "unchecked")
        }
        app.toggles["Walking"].tap()
        // Semantic checkbox has checked state after tap
        if let temp = app.toggles["Walking"].value, let value = temp as? String {
            XCTAssertTrue(value == "checked")
        }
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }
    
    func testAccessibilityLabelStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Accessible names"].tap()
        app.buttons["accessibilityLabel start state"].tap()
        // Icon button exists and has rubbish label
        XCTAssertTrue(app.buttons["UnlabelledIconButton"].exists)
        XCTAssertTrue(app.buttons["UnlabelledIconButton"].label == "Add People/Follow")
        // More link exists and has no augmentation
        XCTAssertTrue(app.links["GenericLink"].exists)
        XCTAssertTrue(app.links["GenericLink"].label == "More")
        
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testAccessibilityLabelEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Accessible names"].tap()
        app.buttons["accessibilityLabel end state"].tap()
        // Icon button exists and has rubbish label
        XCTAssertTrue(app.buttons["LabelledIconButton"].exists)
        XCTAssertTrue(app.buttons["LabelledIconButton"].label == "Add user")
        // More link exists and has no augmentation
        XCTAssertTrue(app.links["MeaningfulLink"].exists)
        XCTAssertTrue(app.links["MeaningfulLink"].label == "More about birds")
        
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testAccessibilityInputLabelsStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Accessible names"].tap()
        app.buttons["accessibilityInputLabels start state"].tap()
        // Icon button exists and has one label
        XCTAssertTrue(app.buttons["OneLabelButton"].exists)
        XCTAssertTrue(app.buttons["OneLabelButton"].label == "Close")
        // More link exists and has long label
        XCTAssertTrue(app.links["AugmentedLink"].exists)
        XCTAssertTrue(app.links["AugmentedLink"].label == "More about birds")
        
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testAccessibilityInputLabelsEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Accessible names"].tap()
        app.buttons["accessibilityInputLabels end state"].tap()
        // Icon button exists, cannot test content of accessibilityInputLabels
        XCTAssertTrue(app.buttons["MultiLabelButton"].exists)
        // More link exists, cannot test content of accessibilityInputLabels
        XCTAssertTrue(app.links["FixedLink"].exists)
        
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testAccessibilityDescriptionsStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Accessible descriptions"].tap()
        app.buttons["TextField start state"].tap()
        // Phone number text field exists, can't test accessibilityHint content
        XCTAssertTrue(app.textViews["PhoneNumber"].exists)
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testAccessibilityDescriptionsEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Accessible descriptions"].tap()
        app.buttons["TextField end state"].tap()
        // Phone number text field exists, can't test accessibilityHint content
        XCTAssertTrue(app.textViews["PhoneNumber"].exists)
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testTraitsStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Accessibility traits"].tap()
        app.buttons["Accessibility traits start state"].tap()
        // There is no button called NoTraitTile
        XCTAssertFalse(app.buttons["NoTraitTile"].exists)
        // Native link has button trait applied
        XCTAssertTrue(app.buttons["NativeLink"].exists)
        // Native link semantic is being clobbered by Button trait
        XCTAssertFalse(app.links["NativeLink"].exists)
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testTraitsEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Accessibility traits"].tap()
        app.buttons["Accessibility traits end state"].tap()
        // There is no button called NoTraitTile
        XCTAssertTrue(app.buttons["ButtonTraitTile"].exists)
        // Link doesn't have button trait applied
        XCTAssertFalse(app.buttons["NoButtonLink"].exists)
        // Link semantic is being asserted
        XCTAssertTrue(app.links["NoButtonLink"].exists)
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testDecorativeImagesStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Images"].tap()
        app.buttons["Decorative image start state"].tap()
        // Decorative image exists and has default label
        XCTAssertTrue(app.images["DecorativeImage"].exists)
        XCTAssertEqual(app.images["DecorativeImage"].label, "Card")
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testDecorativeImagesEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Images"].tap()
        app.buttons["Decorative image end state"].tap()
        // Decorative image doesn't exist for accessibility services
        XCTAssertFalse(app.images["DecorativeImage"].exists)
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testInformativeImagesStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Images"].tap()
        app.buttons["Informative image start state"].tap()
        // Informative image exists and has filename label
        XCTAssertTrue(app.images["InformativeImage"].exists)
        XCTAssertEqual(app.images["InformativeImage"].label, "BurmeseCat")
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped, .contrast])
    }

    func testInformativeImagesEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Images"].tap()
        app.buttons["Informative image end state"].tap()
        // Decorative image exists and has descriptive label
        XCTAssertTrue(app.images["InformativeImage"].exists)
        XCTAssertTrue(app.images["InformativeImage"].label.contains("An adult cat sits on a table"))
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped, .contrast])
    }

    func testFunctionalImagesStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Images"].tap()
        app.buttons["Functional image start state"].tap()
        // Functional image 1 exists and default label is inherited by parent button
        XCTAssertTrue(app.buttons["FunctionalImage1"].exists)
        XCTAssertEqual(app.buttons["FunctionalImage1"].label, "Close")
        // Functional image 2 exists and default label is inherited by parent button
        XCTAssertTrue(app.buttons["FunctionalImage2"].exists)
        XCTAssertEqual(app.buttons["FunctionalImage2"].label, "Trash")
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testFunctionalImagesEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Images"].tap()
        app.buttons["Functional image end state"].tap()
        // Functional image 1 accessibilityLabel is inherited by parent button
        XCTAssertTrue(app.buttons["FunctionalImage1"].exists)
        XCTAssertEqual(app.buttons["FunctionalImage1"].label, "Dismiss notification")
        // Functional image 2 parent has descriptive label directly
        XCTAssertTrue(app.buttons["FunctionalImage2"].exists)
        XCTAssertEqual(app.buttons["FunctionalImage2"].label, "Delete all files")
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testComplexImagesStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Images"].tap()
        app.buttons["Complex image start state"].tap()
        // Complex image exists and has filename as label
        XCTAssertTrue(app.images["ComplexImage"].exists)
        XCTAssertEqual(app.images["ComplexImage"].label, "complex")
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped, .contrast])
    }

    func testComplexImagesEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Images"].tap()
        app.buttons["Complex image end state"].tap()
        // Complex image exists and has filename as label
        XCTAssertTrue(app.images["ComplexImage"].exists)
        XCTAssertEqual(app.images["ComplexImage"].label, "Venn diagram of HTML content category relationships. Detailed description below.")
        // Detailed description of complex image exists
        XCTAssertTrue(app.disclosureTriangles["DetailedDescription"].exists)
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped, .contrast])
    }

    func testDataTablesStart() throws {
        let app1 = XCUIApplication()
        app1.launchArguments += ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryAccessibilityXXXL"]
        app1.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app1.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app1.swipeUp()
        app1.swipeUp()
        app1.buttons["Tables"].tap()
        app1.buttons["Data tables start state"].tap()
        app1.swipeUp()
        // Fixed header shown at max. text size
        XCTAssertTrue(app1.staticTexts["FixedHeader"].exists)
        // Plain flight number exists
        XCTAssertTrue(app1.staticTexts["PlainFlightNum"].exists)
        XCTAssertEqual(app1.staticTexts["PlainFlightNum"].firstMatch.label, "IS1234")
        app1.terminate()
        
        let app2 = XCUIApplication()
        app2.launch()
        if UIDevice.current.userInterfaceIdiom == .pad {
            app2.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app2.buttons["Tables"].tap()
        app2.buttons["Data tables start state"].tap()
        // Fixed header shown at default text size
        XCTAssertTrue(app2.staticTexts["FixedHeader"].exists)

        try callAccessibilityAuditWithExceptions(app: app1, exceptions: [.textClipped, .contrast])
    }

    func testDataTablesEndLargeText() throws {
        let app = XCUIApplication()
        app.launchArguments += ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryAccessibilityXXXL"]
        app.launch()
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.swipeUp()
        app.swipeUp()
        app.buttons["Tables"].tap()
        app.buttons["Data tables end state"].tap()
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        // Fixed header NOT shown at max. text size
        XCTAssertFalse(app.staticTexts["FixedLabelHeader"].exists)
        // Default accessibilityLabel layout not shown
        XCTAssertFalse(app.staticTexts["DefaultLabelFlightNum"].exists)
        // Big layout shown for accessibilityLabel table
        XCTAssertTrue(app.staticTexts["BigLabelFlightNum"].exists)
        XCTAssertEqual(app.staticTexts["BigLabelFlightNum"].firstMatch.label, "Flight: IS1234")
        app.swipeUp()
        app.swipeUp()
        // Default accessibilityValue layout not shown
        XCTAssertFalse(app.staticTexts["DefaultValueFlightNum"].exists)
        // Big layout shown for accessibilityValue table
        XCTAssertTrue(app.staticTexts["BigValueFlightNum"].exists)
        XCTAssertEqual(app.staticTexts["BigValueFlightNum"].firstMatch.label, "Flight: IS1234")
        
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped, .contrast])
    }
    
    func testDataTablesEndDefaultText() throws {
        let app = XCUIApplication()
        app.launch()
        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Tables"].tap()
        app.buttons["Data tables end state"].tap()
        // Fixed header IS shown at default text size BUT hidden from accessibility API, hence false test
        XCTAssertFalse(app.staticTexts["FixedLabelHeader"].exists)
        // Default accessibilityLabel layout IS shown
        XCTAssertTrue(app.staticTexts["DefaultLabelFlightNum"].exists)
        XCTAssertEqual(app.staticTexts["DefaultLabelFlightNum"].firstMatch.label, "Flight IS1234")
        // Big layout NOT shown for accessibilityLabel table
        XCTAssertFalse(app.staticTexts["BigLabelFlightNum"].exists)
        // Default accessibilityValue layout IS shown and label embedded in value
        XCTAssertTrue(app.staticTexts["DefaultValueFlightNum"].exists)
        if let temp = app.staticTexts["DefaultValueFlightNum"].firstMatch.value, let value = temp as? String {
            XCTAssertTrue(value == "Flight")
        }
        // Big layout NOT shown for accessibilityValue table
        XCTAssertFalse(app.staticTexts["BigValueFlightNum"].exists)
    }

    func testButtonGroupStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Groups"].tap()
        app.buttons["Button group start state"].tap()
        // Buttons exist
        XCTAssertTrue(app.buttons["YesButton"].exists)
        XCTAssertTrue(app.buttons["NoButton"].exists)
        XCTAssertTrue(app.buttons["MaybeButton"].exists)
        XCTAssertTrue(app.buttons["Huh?Button"].exists)

        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped, .contrast])
    }

    func testButtonGroupEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Groups"].tap()
        app.buttons["Button group end state"].tap()
        // Buttons exist
        XCTAssertTrue(app.buttons["YesButton"].exists)
        XCTAssertTrue(app.buttons["NoButton"].exists)
        XCTAssertTrue(app.buttons["MaybeButton"].exists)
        XCTAssertTrue(app.buttons["Huh?Button"].exists)
        // Button group exists and is labelled
        XCTAssertTrue(app.otherElements["ButtonGroup"].exists)
        XCTAssertEqual(app.otherElements["ButtonGroup"].label, "Which one are you?")
        
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped, .contrast])
    }

    func testInstructionsStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Instructions"].tap()
        app.buttons["Form field instructions start state"].tap()
        // Text fields exist and are labelled
        XCTAssertTrue(app.textViews["PhoneText1"].exists)
        XCTAssertEqual(app.textViews["PhoneText1"].label, "Phone number")
        XCTAssertTrue(app.textViews["PhoneText2"].exists)
        XCTAssertEqual(app.textViews["PhoneText2"].label, "Phone number, required")

        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testInstructionsEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Instructions"].tap()
        app.buttons["Form field instructions end state"].tap()
        // Text fields exist and are labelled - can't check accessibilityHint content
        XCTAssertTrue(app.textViews["PhoneText1"].exists)
        XCTAssertEqual(app.textViews["PhoneText1"].label, "Phone number")
        XCTAssertTrue(app.textViews["PhoneText2"].exists)
        XCTAssertEqual(app.textViews["PhoneText2"].label, "Phone number, required")

        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testKeyboardsStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Keyboards"].tap()
        app.buttons["Keyboards start state"].tap()
        // Text fields exist and are labelled
        XCTAssertTrue(app.textFields["DOBText"].exists)
        XCTAssertEqual(app.textFields["DOBText"].label, "Date of birth, format D D slash M M slash Y Y Y Y")
        XCTAssertTrue(app.textFields["WebAddressText"].exists)
        XCTAssertEqual(app.textFields["WebAddressText"].label, "Web address")
        XCTAssertTrue(app.textFields["AgeText"].exists)
        XCTAssertEqual(app.textFields["AgeText"].label, "Age")
        XCTAssertTrue(app.textFields["PhoneText"].exists)
        XCTAssertEqual(app.textFields["PhoneText"].label, "Phone number")
        XCTAssertTrue(app.textFields["EmailText"].exists)
        XCTAssertEqual(app.textFields["EmailText"].label, "Email")
        XCTAssertTrue(app.textFields["AmountText"].exists)
        XCTAssertEqual(app.textFields["AmountText"].label, "Amount")
        XCTAssertTrue(app.textFields["SocialText"].exists)
        XCTAssertEqual(app.textFields["SocialText"].label, "Social handle")

        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testKeyboardsEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Keyboards"].tap()
        app.buttons["Keyboards end state"].tap()
        
        // Text fields exist and are labelled and are showing a keyboard that suits their data type
        XCTAssertTrue(app.textFields["DOBText"].exists)
        XCTAssertEqual(app.textFields["DOBText"].label, "Date of birth, format D D slash M M slash Y Y Y Y")
        app.textFields["DOBText"].tap()
        XCTAssertTrue(app.keys["1"].exists)
        
        XCTAssertTrue(app.textFields["WebAddressText"].exists)
        XCTAssertEqual(app.textFields["WebAddressText"].label, "Web address")
        app.textFields["WebAddressText"].tap()
        XCTAssertTrue(app.keys[".com"].exists)

        XCTAssertTrue(app.textFields["AgeText"].exists)
        XCTAssertEqual(app.textFields["AgeText"].label, "Age")
        app.textFields["AgeText"].tap()
        XCTAssertTrue(app.keys["1"].exists)

        XCTAssertTrue(app.textFields["PhoneText"].exists)
        XCTAssertEqual(app.textFields["PhoneText"].label, "Phone number")
        app.textFields["PhoneText"].tap()
        XCTAssertTrue(app.keys["1"].exists)
        
        XCTAssertTrue(app.textFields["EmailText"].exists)
        XCTAssertEqual(app.textFields["EmailText"].label, "Email")
        app.textFields["EmailText"].tap()
        XCTAssertTrue(app.keys["@"].exists)

        app.swipeUp()
        XCTAssertTrue(app.textFields["AmountText"].exists)
        XCTAssertEqual(app.textFields["AmountText"].label, "Amount")
        app.textFields["AmountText"].tap()
        XCTAssertTrue(app.keys["."].exists)

        XCTAssertTrue(app.textFields["SocialText"].exists)
        XCTAssertEqual(app.textFields["SocialText"].label, "Social handle")
        app.textFields["SocialText"].tap()
        XCTAssertTrue(app.keys["#"].exists)

        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped, .contrast])
    }

    func testAutocompleteStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Text field autofill"].tap()
        app.buttons["Autofill start state"].tap()
        // Text fields exist and are labelled
        XCTAssertTrue(app.textFields["DOBText"].exists)
        XCTAssertEqual(app.textFields["DOBText"].label, "Date of birth, format D D slash M M slash Y Y Y Y")
        XCTAssertTrue(app.textFields["AddressLine1Text"].exists)
        XCTAssertEqual(app.textFields["AddressLine1Text"].label, "Address line 1")
        XCTAssertTrue(app.textFields["UserNameText"].exists)
        XCTAssertEqual(app.textFields["UserNameText"].label, "User name")
        XCTAssertTrue(app.textFields["PhoneText"].exists)
        XCTAssertEqual(app.textFields["PhoneText"].label, "Phone number")
        XCTAssertTrue(app.textFields["EmailText"].exists)
        XCTAssertEqual(app.textFields["EmailText"].label, "Email")
        XCTAssertTrue(app.textFields["CCNumberText"].exists)
        XCTAssertEqual(app.textFields["CCNumberText"].label, "Credit card number")
        XCTAssertTrue(app.textFields["PasscodeText"].exists)
        XCTAssertEqual(app.textFields["PasscodeText"].label, "Passcode")

        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testAutocompleteEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Text field autofill"].tap()
        app.buttons["Autofill end state"].tap()
        // Text fields exist and are labelled, can't check autofill status
        XCTAssertTrue(app.textFields["DOBText"].exists)
        XCTAssertEqual(app.textFields["DOBText"].label, "Date of birth, format D D slash M M slash Y Y Y Y")
        XCTAssertTrue(app.textFields["AddressLine1Text"].exists)
        XCTAssertEqual(app.textFields["AddressLine1Text"].label, "Address line 1")
        XCTAssertTrue(app.textFields["UserNameText"].exists)
        XCTAssertEqual(app.textFields["UserNameText"].label, "User name")
        XCTAssertTrue(app.textFields["PhoneText"].exists)
        XCTAssertEqual(app.textFields["PhoneText"].label, "Phone number")
        XCTAssertTrue(app.textFields["EmailText"].exists)
        XCTAssertEqual(app.textFields["EmailText"].label, "Email")
        XCTAssertTrue(app.textFields["CCNumberText"].exists)
        XCTAssertEqual(app.textFields["CCNumberText"].label, "Credit card number")
        XCTAssertTrue(app.textFields["PasscodeText"].exists)
        XCTAssertEqual(app.textFields["PasscodeText"].label, "Passcode")

        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testLiveRegionsStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Live regions"].tap()
        app.buttons["Live region start state"].tap()
        // Timer text exists, can't check traits applied
        XCTAssertTrue(app.staticTexts["TimerText"].exists)

        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testLiveRegionsEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Live regions"].tap()
        app.buttons["Live region end state"].tap()
        // Timer text exists, can't check traits applied
        XCTAssertTrue(app.staticTexts["TimerText"].exists)

        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testSemanticCheckboxStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Checkboxes"].tap()
        app.buttons["Checkbox start state"].tap()
        // All fake checkboxes are present in staticTexts collection
        XCTAssertTrue(app.staticTexts["Nintendo Switch"].exists)
        XCTAssertTrue(app.staticTexts["Sony Playstation"].exists)
        XCTAssertTrue(app.staticTexts["Microsoft Xbox"].exists)
        XCTAssertTrue(app.staticTexts["PC"].exists)

        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testSemanticCheckboxEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.buttons["Checkboxes"].tap()
        app.buttons["Checkbox end state"].tap()
        // Semantic checkbox is in toggles collection, not static text
        XCTAssertTrue(app.otherElements["PC"].exists)
        // Semantic checkbox has initial unchecked state
        if let temp = app.otherElements["PC"].value, let value = temp as? String {
            XCTAssertTrue(value == "unchecked")
        }
        app.otherElements["PC"].tap()
        // Semantic checkbox has checked state after tap
        if let temp = app.otherElements["PC"].value, let value = temp as? String {
            XCTAssertTrue(value == "checked")
        }
        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }
    
    func testStarRatingsStart() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.swipeUp()
        app.buttons["Star rating widget"].tap()
        app.buttons["Star rating widget start state"].tap()
        // Individual ratings buttons are present
        XCTAssertTrue(app.buttons["StarRatingButton1"].exists)
        XCTAssertTrue(app.buttons["StarRatingButton2"].exists)
        XCTAssertTrue(app.buttons["StarRatingButton3"].exists)
        XCTAssertTrue(app.buttons["StarRatingButton4"].exists)
        XCTAssertTrue(app.buttons["StarRatingButton5"].exists)

        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func testStarRatingsEnd() throws {
        let app = XCUIApplication()
        app.launch()

        if UIDevice.current.userInterfaceIdiom == .pad {
            app.navigationBars.buttons["ToggleSidebar"].tap()
        }
        app.swipeUp()
        app.buttons["Star rating widget"].tap()
        app.buttons["Star rating widget end state"].tap()
        // Rating is represented by a labelled stepper
        XCTAssertTrue(app.steppers["StarRatingStepper"].exists)
        XCTAssertEqual(app.steppers["StarRatingStepper"].label, "Rate my restaurant")

        try callAccessibilityAuditWithExceptions(app: app, exceptions: [.textClipped])
    }

    func callAccessibilityAuditWithExceptions(app: XCUIApplication, exceptions: [XCUIAccessibilityAuditType]) throws {
        if #available(iOS 17.0, *) {
            try app.performAccessibilityAudit() { issue in
                var shouldIgnore = false
                      
                if exceptions.contains(issue.auditType) {
                    // Ignore nominated exceptions
                    shouldIgnore = true
                }
                return shouldIgnore
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
