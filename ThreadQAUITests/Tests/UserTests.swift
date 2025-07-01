//
//  UserTests.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/26/25.
//

import Foundation
import XCTest

final class UserTests: XCTestCase {
    private var loginScreen = LoginScreen()
    private var homeScreen: HomeScreen!
    private var serviceManager = ServiceManager()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        
        let email = "eve.holt@reqres.in"
        let password = "cityslicka"

        homeScreen = loginScreen.auth(email: email, pass: password)
    }
    
    override func tearDown() {
        super.tearDown()
        takeScreenshot()
        app.terminate()
    }
    
    func takeScreenshot(name screenshotName: String? = nil) {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot, quality: .original)
        attachment.name = screenshotName ?? name + "_" + UUID().uuidString
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testUserInfo() {
        let profileScreen = homeScreen.openProfile()
        
        let userEmail = profileScreen.getEmail()
        let userFirstName = profileScreen.getName()
        let userLastName = profileScreen.getLastName()
        let userHasImage = profileScreen.isImageExist()
        
        XCTAssertEqual(userEmail, "janet.weaver@reqres.in")
        XCTAssertEqual(userFirstName, "Janet")
        XCTAssertEqual(userLastName, "Weaver")
        XCTAssertTrue(userHasImage)
    }
    
    func testLogOut() {
        let isLoggedOut = homeScreen.logOut().isLoginScreen()
        XCTAssertTrue(isLoggedOut)
    }
    
    func testAddNewUser() {
        let user = UserReg(firstName: "Dwayne", lastName: "Carter", email: "lil@wayne.com", password: "youngMula")
        let userCountBefore = homeScreen.getImagesCound()
        
        let userCountAfter = homeScreen
            .addNewUser()
            .fillFields(user: user)
            .getImagesCound()
        XCTAssertNotEqual(userCountBefore, userCountAfter)
    }
    
    func testOpenRandomUser() {
        let randomUser = getRandomUser()
        let userDetail = homeScreen.openUser(textOrEmail: randomUser.email)
        
        let name = userDetail.getUserName()
        let email = userDetail.getEmailField()
        let hasImage = userDetail.isImageExist()
        
        XCTAssertEqual(email, randomUser.email)
        XCTAssertEqual(name, randomUser.first_name + randomUser.last_name)
        XCTAssertTrue(hasImage)
    }
    
    private func getRandomUser() -> UserRequest {
        let url = serviceManager.getUsers(pageNumber: 2)
        var response = serviceManager.getRequest(resource: url, decodeType: RequestModel.self)
        return response.data.randomElement()!
    }
}
