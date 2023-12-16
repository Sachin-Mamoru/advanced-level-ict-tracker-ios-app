//
//  ProfileViewControllerTests.swift
//  Finance CalculatorTests
//
//  Created by Jamith Nimantha on 2023-08-26.
//

import XCTest
@testable import Finance_Calculator

class ProfileViewControllerTests: XCTestCase {
    
    var profileViewController: ProfileViewController!


//    override func setUpWithError() throws {
//        try super.setUpWithError()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        profileViewController = storyboard.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController
//        profileViewController.loadViewIfNeeded()
//    }
//
//    override func tearDownWithError() throws {
//        profileViewController = nil
//        try super.tearDownWithError()
//    }
//
//    func testProfileNameEditing() {
//            // Simulate tapping on the profile name label
//            profileViewController.profileNameTapped()
//
//            // Access the presented alert controller
//            let alertController = profileViewController.presentedViewController as? UIAlertController
//            XCTAssertNotNil(alertController)
//
//            // Simulate typing a new name in the alert controller's text field
//            alertController?.textFields?.first?.text = "New Name"
//
//            // Simulate tapping the "Save" action
//                if let saveAction = alertController?.actions.last {
//                    saveAction.isEnabled = true
//                    let saveExpectation = expectation(description: "Save Expectation")
//                    saveAction.setValue(saveExpectation, forKey: "handler")
//                    profileViewController.present(alertController!, animated: false) {
//                        saveAction.setValue(saveExpectation, forKey: "handler")
//                        saveAction.isEnabled = true
//                    }
//                    wait(for: [saveExpectation], timeout: 5.0)
//                }
//
//            // Check if the profile name label has been updated
//            XCTAssertEqual(profileViewController.profileName.text, "New Name")
//
//            // Check if the new name has been saved in UserDefaults
//            XCTAssertEqual(UserDefaults.standard.string(forKey: "ProfileName"), "New Name")
//        }
//
//    func testImagePickerController() {
//            // Simulate selecting an image
//            let selectedImage = UIImage(named: "testImage")
//            profileViewController.imagePickerController(
//                UIImagePickerController(),
//                didFinishPickingMediaWithInfo: [.originalImage: selectedImage!])
//
//            // Check if the profile image view has been updated
//            XCTAssertEqual(profileViewController.profileImg.image, selectedImage)
//
//            // Check if the new image data has been saved in UserDefaults
//            let imageData = UserDefaults.standard.data(forKey: "ProfileImage")
//            XCTAssertNotNil(imageData)
//            let loadedImage = UIImage(data: imageData!)
//            XCTAssertEqual(loadedImage, selectedImage)
//    }



}
