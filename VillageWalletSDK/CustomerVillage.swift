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

	public func retrievePaymentRequestDetailsByQRCode(
		qrCode: String,
		callback: @escaping ApiResult<CustomerPaymentRequest>
	) -> Void {
		api.retrievePaymentRequestDetailsByQRCode(
			qrCodeId: qrCode,
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
		paymentRequest: CustomerPaymentRequest,
		instrument: PaymentInstrument,
		callback: @escaping ApiResult<CustomerTransactionSummary>
	) {
		api.makePayment(
			paymentRequest: paymentRequest,
			instrument: instrument,
			callback: callback
		)
	}

	public func retrievePaymentSessionById(
		paymentSessionId: String,
		callback: @escaping ApiResult<PaymentSession>
	) {
		api.retrieveCustomerPaymentSessionById(
			paymentSessionId: paymentSessionId,
			callback: callback
		)
	}

	public func retrievePaymentSessionByQRCode(
		qrCodeId: String,
		callback: @escaping ApiResult<PaymentSession>
	) {
		api.retrieveCustomerPaymentSessionByQRCode(
			qrCodeId: qrCodeId,
			callback: callback
		)
	}

	public func setHost(host: String) {
		api.setHost(host: host)
		authenticator.setHost(host: host)
	}
}
