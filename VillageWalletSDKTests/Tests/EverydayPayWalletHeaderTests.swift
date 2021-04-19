import XCTest
import Hamcrest

import VillageWalletSDK

class EverydayPayWalletHeaderTests: XCTestCase {
	func testShouldSetEverydayPayWalletHeaderToTrueWhenEverydayPayWalletChosen() {
		let options = VillageOptions(apiKey: "", baseUrl: "", wallet: Wallet.EVERYDAY_PAY)

		let headers = createHeaders(options: options)

		assertThat(headers[X_EVERYDAY_PAY_WALLET], equalTo("true"))
	}

	func testShouldSetEverydayPayWalletHeaderToFalseWhenEverydayPayWalletNotChosen() {
		let options = VillageOptions(apiKey: "", baseUrl: "", wallet: Wallet.MERCHANT)

		let headers = createHeaders(options: options)

		assertThat(headers[X_EVERYDAY_PAY_WALLET], equalTo("false"))
	}

	func testShouldSetEverydayPayWalletHeaderToFalseWhenNoWalletChosen() {
		let options = VillageOptions(apiKey: "", baseUrl: "", wallet: nil)

		let headers = createHeaders(options: options)

		assertThat(headers[X_EVERYDAY_PAY_WALLET], equalTo("false"))
	}

	private func createHeaders(options: VillageOptions) -> [String: String] {
		let factory = EverydayPayWalletHeader(options: options)

		var headers: [String: String] = [:]
		factory.addHeaders(headers: &headers)

		return headers
	}
}
