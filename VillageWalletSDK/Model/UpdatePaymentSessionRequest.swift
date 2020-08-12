import UIKit

public protocol UpdatePaymentSessionRequest {
	func additionalInfo() -> DynamicPayload
}
