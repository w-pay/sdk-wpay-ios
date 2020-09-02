import XCTest
import Hamcrest

import VillageWalletSDK

class StoringApiAuthenticatorTests: XCTestCase {
	private var apiAuthenticator: StubApiAuthenticator?
	private var credentialsStore: StubCredentialsStore?

	private var storingApiAuthenticator: StoringApiAuthenticator<String>?
	private var callbackCalled: Bool = false

	override func setUp() {
		super.setUp()

		apiAuthenticator = StubApiAuthenticator()
		credentialsStore = StubCredentialsStore()

		storingApiAuthenticator = StoringApiAuthenticator(
			delegate: apiAuthenticator!,
			store: credentialsStore!)

		callbackCalled = false
	}

	func testShouldStoreCredentialsWhenSuccessful() {
		storingApiAuthenticator!.authenticate { result in self.callbackCalled = true }

		assertThat(credentialsStore!.storedCredentials, not(nilValue()))
		assertThat(callbackCalled, equalTo(true))
	}

	func testShouldNotStoreCredentialsWhenError() {
		apiAuthenticator!.error = ApiError.error(error: NSError(domain: "", code: 0))

		storingApiAuthenticator?.authenticate { result in self.callbackCalled = true }

		assertThat(credentialsStore!.storedCredentials, nilValue())
		assertThat(callbackCalled, equalTo(true))
	}
}
