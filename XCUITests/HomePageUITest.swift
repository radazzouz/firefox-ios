/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import XCTest

class HomePageUITest: BaseTestCase {

    override func setUp() {
        super.setUp()
        dismissFirstRunUI()
		let app = XCUIApplication()
		app.launchArguments.append("BUDDYBUILD_UI_TESTS_VIDEO_RECORDING")
		app.launch()
    }

    override func tearDown() {
        XCUIDevice().press(.home)
		sleep(1)     
		super.tearDown()
    }

    func testSetInternalURLAsHomepage() {
        let app = XCUIApplication()

        loadWebPage("http://en.m.wikipedia.org/wiki/Main_Page")
        app.buttons["Reader View"].tap()
        app.buttons["Menu"].tap()
        app.cells["Set Homepage"].tap()

        XCTAssertTrue(app.alerts.count == 0)
    }
}
