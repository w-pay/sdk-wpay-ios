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

	override func authenticate(callback: @escaping ApiResult<String>) {
		guard let error = self.error else {
			return callback(.success("credentials!"))
		}

		callback(.failure(error))
	}
}
