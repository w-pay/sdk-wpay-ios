import VillageWalletSDK

class StubCredentialsStore: AnyCredentialsStore<String> {
	public var storedCredentials: String?

	override func storeCredentials(credentials: String) {
		storedCredentials = credentials
	}
}
