import UIKit

/**
	Defines the API operations that the SDK can use to call the Merchant Village API

	The SDK is technology agnostic with applications being able to choose an implementation that
	meets the needs and preexisting technology choices of the application.

	Implementations of the protocol may provide additional constraints on the user.
 */
public protocol VillageMerchantApiRepository {
	var admin: AdministrationApiRepository { get }
	var dp: DigitalPayRepository { get }
	var payments: MerchantPaymentsRepository { get }
	var paymentAgreements: MerchantPaymentAgreementsRepository { get }
	var paymentSession: MerchantPaymentSessionsRepository { get }
	var preferences: MerchantPreferencesRepository { get }
	var qr: QRCodeRepository { get }
	var schemas: SchemasRepository { get }
	var transactions: MerchantTransactionsRepository { get }

	/**
	 Options that were given at SDK initialisation
	 */
	var options: VillageMerchantOptions { get }
}
