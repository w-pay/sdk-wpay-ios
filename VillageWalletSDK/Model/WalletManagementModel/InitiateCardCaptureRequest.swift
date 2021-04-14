import UIKit

/**
 The JSON request structure of the Initiate Card Capture endpoint.
 */
public protocol InitiateCardCaptureRequest {
	/* A merchant application specific reference number. This number should uniquely identify the transaction in the merchant’s system. */
	var clientReference: String { get }
}
