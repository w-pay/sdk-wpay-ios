import VillageWalletSDK

class StubApiAuthenticator: AnyApiAuthenticator<String> {
	public var error: ApiError?

	init(error: ApiError?) {
		self.error = error

		super.init()
	}

	convenience override init() {
		self.init(error: nil)
	}

	override func authenticate(completion: @escaping ApiCompletion<String>) {
		guard let error = self.error else {
			return completion(.success("credentials!"))
		}

		completion(.failure(error))
	}
}
