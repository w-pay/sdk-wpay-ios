import UIKit

public protocol CreatePaymentSessionRequest {
	var location: String { get }

	var merchantInfo: DynamicPayload { get }

	// should return false by default
	var generateQR: Bool { get }

	// should return 0 by default
	var timeToLivePaymentSession: Int { get }

	// should return 0 by default
	var timeToLiveQR: Int { get }
}
