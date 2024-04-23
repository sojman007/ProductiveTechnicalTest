@suppressWarnings('pmd')
@isTest
global without sharing class LogCalloutMock implements System.HttpCalloutMock {
    
    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody(request.getBody());
        response.setStatusCode(200);
        return response;
    }
}