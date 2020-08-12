import UIKit

public protocol PaymentInstrumentAddition {
	func clientReference() -> String

	func wallet() -> Wallet
}
