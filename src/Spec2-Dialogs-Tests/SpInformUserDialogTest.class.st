Class {
	#name : 'SpInformUserDialogTest',
	#superclass : 'TestCase',
	#category : 'Spec2-Dialogs-Tests',
	#package : 'Spec2-Dialogs-Tests'
}

{ #category : 'tests - informUserDuring' }
SpInformUserDialogTest >> testInformUserDuring [

	self shouldnt: [ SpInformUserDialog new informUser: 'hello' during: [  (Delay forMilliseconds: 100)  wait] ] raise: Error
]

{ #category : 'tests - progress bar' }
SpInformUserDialogTest >> testInformUserDuringExecutesItsBlock [

	| executed | 
	executed := false. 
	SpInformUserDialog new informUser: 'hello' during: [ executed := true ].
	self assert: executed.
]

{ #category : 'tests - progress bar' }
SpInformUserDialogTest >> testInformUserDuringExecutesTheBlockOnlyOnce [

	| count |
	count := 0.
	SpInformUserDialog new 
		informUser: 'I am a text' during: [ count := count + 1 ].
		
	self assert: count equals: 1
]

{ #category : 'tests - progress bar' }
SpInformUserDialogTest >> testInformUserDuringInSpApplicationExecutesTheBlockOnlyOnce [

	| count |
	count := 0.
	SpApplication new 
		informUser: 'I am a text' during: [ count := count + 1 ].
		
	self assert: count equals: 1
]

{ #category : 'tests - informUserDuring' }
SpInformUserDialogTest >> testInformUserDuringViaApplication [

	self shouldnt: [ SpPresenter new application informUser: 'hello' during: [  (Delay forMilliseconds: 100)  wait] ] raise: Error.
	
]

{ #category : 'tests - informUserDuring' }
SpInformUserDialogTest >> testInformUserDuringViaPresenter [

	self shouldnt: [ SpPresenter new informUser: 'hello' during: [  (Delay forMilliseconds: 100)  wait] ] raise: Error.
	self shouldnt: [ SpPresenter new informUser: 'hello' during: [  (Delay forMilliseconds: 100)  wait] ] raise: Error
]

{ #category : 'tests - progress bar' }
SpInformUserDialogTest >> testInformUserReturnsValueOfTheBlock [

	| returned | 
	returned := SpInformUserDialog new informUser: 'hello' during: [ 42 ].
	self assert: returned equals: 42.
]

{ #category : 'tests - progress bar' }
SpInformUserDialogTest >> testProgressInformUserDuringExecutesItsBlock [

	| executed | 
	executed := false. 
	SpProgressDialog new informUser: 'hello' during: [ executed := true.  ]. 
	self assert: executed.
]
