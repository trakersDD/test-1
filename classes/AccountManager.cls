@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
	@HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
		String right = request.requestURI.split('/Accounts/')[1];
        String accountId = right.split('/')[0];
        
        
        return [SELECT Id,Name,(select id,name from contacts) FROM Account where Id =: accountId limit 1];
    }
}