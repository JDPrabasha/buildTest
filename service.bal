import ballerina/http;

type TokenValidatorConfig record {|
    string issuer;
    string[] audience;
|};

configurable TokenValidatorConfig tokenValidatorConfig = {
    issuer: "tyu",
    audience: ["1000000000000-abcdefghijklmnopqrstuvwxyz0123456789.apps.googleusercontent.com"]
};

service / on new http:Listener(8080) {

    resource function get greeting() returns string {
        return string `Hello! Issuer: ${tokenValidatorConfig.issuer}, Audience: ${tokenValidatorConfig.audience.toString()}`;
    }
}
