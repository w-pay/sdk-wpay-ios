import UIKit

/**
 * Entry point into the SDK. It is responsible for managing the relationship between app
 * concerns, and calling the API.
 */
public class CustomerVillage<A>: Configurable {
	private let api: VillageCustomerApiRepository
	private let authenticator: AnyApiAuthenticator<A>

	public init(api: VillageCustomerApiRepository, authenticator: AnyApiAuthenticator<A>) {
		self.api = api
		self.authenticator = authenticator
	}

	public func authenticate(callback: @escaping ApiResult<A>) {
		return authenticator.authenticate(callback: callback)
	}

	public func retrievePaymentRequestDetailsBy(
		qrCodeId: String,
		callback: @escaping ApiResult<CustomerPaymentRequest>
	) -> Void {
		api.retrievePaymentRequestDetailsBy(
			qrCodeId: qrCodeId,
			callback: callback
		)
	}

	public func retrievePaymentInstruments(
		wallet: Wallet,
		callback: @escaping ApiResult<PaymentInstruments>
	) -> Void {
		api.retrievePaymentInstruments(wallet: wallet, callback: callback)
	}

	public func makePayment(
		paymentRequestId: String,
		instrument: PaymentInstrumentIdentifier,
		secondaryInstruments: [SecondaryPaymentInstrument]?,
		clientReference: String?,
		challengeResponses: [ChallengeResponse]?,
		callback: @escaping ApiResult<CustomerTransactionSummary>
	) {
		api.makePayment(
			paymentRequestId: paymentRequestId,
			primaryInstrument: instrument,
			secondaryInstruments: secondaryInstruments,
			clientReference: clientReference,
			challengeResponses: challengeResponses,
			callback: callback
		)
	}

	public func retrievePaymentSessionBy(
		paymentSessionId: String,
		callback: @escaping ApiResult<PaymentSession>
	) {
		api.retrievePaymentSessionBy(
			paymentSessionId: paymentSessionId,
			callback: callback
		)
	}

	public func retrievePaymentSessionBy(
		qrCodeId: String,
		callback: @escaping ApiResult<PaymentSession>
	) {
		api.retrievePaymentSessionBy(
			qrCodeId: qrCodeId,
			callback: callback
		)
	}

	public func setHost(host: String) {
		api.setHost(host: host)
		authenticator.setHost(host: host)
	}
}
