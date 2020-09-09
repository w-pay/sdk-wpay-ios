/**
	Indicates that a model has an access token that can be used to prove that SDK is authenticated
 */
public protocol HasAccessToken {
	/** An access token obtained from an authentication result */
	var accessToken: String { get }
}
