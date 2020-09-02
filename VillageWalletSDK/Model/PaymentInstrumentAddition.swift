import UIKit

public protocol PaymentInstrumentAddition {
	var clientReference: String { get }

	var wallet: Wallet { get }
}
