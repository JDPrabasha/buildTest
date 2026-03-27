import ballerina/http;

type TokenValidatorConfig record {|
    string issuer;
    string audience;
|};

configurable TokenValidatorConfig tokenValidatorConfig = ?;

service / on new http:Listener(8080) {

    resource function get greeting() returns string {
        return string `Hello! Issuer: ${tokenValidatorConfig.issuer}, Audience: ${tokenValidatorConfig.audience}`;
    }
}
