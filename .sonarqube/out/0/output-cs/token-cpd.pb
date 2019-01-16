∏
_C:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Notify\Domain\INotifySender.cs
	namespace 	
ConsoleApp2
 
. 
Notify 
. 
Domain #
{ 
	interface 
INotifySender 
{ 
void 
Notify 
( 
string 
text 
)  
;  !
} 
}		 Ñ
jC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Notify\Domain\NotifyUserCreatedHandler.cs
	namespace		 	
ConsoleApp2		
 
.		 
Notify		 
.		 
Domain		 #
{

 
public 

class $
NotifyUserCreatedHandler )
:* +
IEventHandler, 9
<9 :
UserCreatedEvent: J
>J K
,K L
IEventHandlerM Z
<Z [
UserNameUpdated[ j
>j k
{ 
private 
readonly 
	IEventBus "
	_eventBus# ,
;, -
private 
readonly 
IUserRepository (
_userRepository) 8
;8 9
public $
NotifyUserCreatedHandler '
(' (
	IEventBus( 1
eventBus2 :
,: ;
IUserRepository< K
userRepositoryL Z
)Z [
{ 	
	_eventBus 
= 
eventBus  
;  !
_userRepository 
= 
userRepository ,
;, -
} 	
public 
Task 
Handle 
( 
UserCreatedEvent +
notification, 8
,8 9
CancellationToken: K
cancellationTokenL ]
)] ^
{ 	
Console 
. 
	WriteLine 
( 
$"  
User is created   0
{0 1
notification2 >
.> ?
Id? A
}A B
 - B E
{E F
notificationG S
.S T
NameT X
}Y Z
"Z [
)[ \
;\ ]
return 
new 
UserUpdateName %
(% &
	_eventBus& /
,/ 0
_userRepository1 @
)@ A
.A B
UpdateUserNameAsyncB U
(U V
notificationV b
.b c
Idc e
,e f
$strg v
)v w
;w x
} 	
public 
Task 
Handle 
( 
UserNameUpdated *
notification+ 7
,7 8
CancellationToken9 J
cancellationTokenK \
)\ ]
{ 	
Console 
. 
	WriteLine 
( 
$"  
User   %
{% &
notification& 2
.2 3
UserId3 9
}9 :
 from : @
{@ A
notificationA M
.M N
PreviousNameN Z
}Z [
 to [ _
{_ `
notification` l
.l m
NewNamem t
}t u
"u v
)v w
;w x
return   
Task   
.   
CompletedTask   %
;  % &
}!! 	
}"" 
}## ˚
jC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Domain\Aggregates\AggregateRoot.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Domain #
.# $

Aggregates$ .
{ 
public 

abstract 
class 
AggregateRoot '
{ 
private 
readonly 
Queue 
< 
IEvent %
>% &
_domainEvents' 4
;4 5
	protected

 
AggregateRoot

 
(

  
)

  !
{ 	
_domainEvents 
= 
new 
Queue  %
<% &
IEvent& ,
>, -
(- .
). /
;/ 0
} 	
public 
virtual 
IEvent 
[ 
] 
PullDomainEvents  0
(0 1
)1 2
{ 	
var 
domainEvents 
= 
_domainEvents ,
., -
ToArray- 4
(4 5
)5 6
;6 7
_domainEvents 
. 
Clear 
(  
)  !
;! "
return 
domainEvents 
;  
} 	
	protected 
void 
Record 
( 
IEvent $
notification% 1
)1 2
{ 	
_domainEvents 
. 
Enqueue !
(! "
notification" .
). /
;/ 0
} 	
} 
} §	
lC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Infrastructure\Command\CommandBus.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Infrastructure +
.+ ,
Command, 3
{ 
public 

class 

CommandBus 
: 
ICommandBus )
{ 
private		 
readonly		 
	IMediator		 "
	_mediator		# ,
;		, -
public 

CommandBus 
( 
	IMediator #
mediator$ ,
), -
{ 	
	_mediator 
= 
mediator  
;  !
} 	
public 
Task 
Send 
< 
TCommand !
>! "
(" #
TCommand# +
command, 3
)3 4
where5 :
TCommand; C
:D E
ICommandF N
{ 	
return 
	_mediator 
. 
Send !
(! "
command" )
)) *
;* +
} 	
} 
} ö
bC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Domain\Command\ICommand.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Domain #
.# $
Command$ +
{ 
public 

	interface 
ICommand 
: 
IRequest  (
{) *
}+ ,
} ˘
eC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Domain\Command\ICommandBus.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Domain #
.# $
Command$ +
{ 
public 

	interface 
ICommandBus  
{ 
Task 
Send 
< 
TCommand 
> 
( 
TCommand $
command% ,
), -
where. 3
TCommand4 <
:= >
ICommand? G
;G H
} 
}		 ‡
iC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Domain\Command\ICommandHandler.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Domain #
.# $
Command$ +
{ 
public 

	interface 
ICommandHandler $
<$ %
in% '
T( )
>) *
:+ ,
IRequestHandler- <
<< =
T= >
>> ?
where@ E
TF G
:H I
ICommandJ R
{ 
} 
}		 Ù

iC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Infrastructure\Events\EventBus.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Infrastructure +
.+ ,
Events, 2
{ 
public 

class 
EventBus 
: 
	IEventBus %
{ 
private		 
readonly		 
	IMediator		 "
	_mediator		# ,
;		, -
public 
EventBus 
( 
	IMediator !
mediator" *
)* +
{ 	
	_mediator 
= 
mediator  
;  !
} 	
public 
async 
Task 
Publish !
<! "
TEvent" (
>( )
() *
params* 0
TEvent1 7
[7 8
]8 9
events: @
)@ A
whereB G
TEventH N
:O P
IEventQ W
{ 	
foreach 
( 
var 
@event 
in  "
events# )
)) *
{ 
await 
	_mediator 
.  
Publish  '
(' (
@event( .
). /
;/ 0
} 
} 	
} 
} ô
_C:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Domain\Events\IEvent.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Domain #
.# $
Events$ *
{ 
public 

	interface 
IEvent 
: 
INotification *
{ 
} 
} ü
bC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Domain\Events\IEventBus.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Domain #
.# $
Events$ *
{ 
public 

	interface 
	IEventBus 
{ 
Task 
Publish 
< 
TEvent 
> 
( 
params #
TEvent$ *
[* +
]+ ,
events- 3
)3 4
where5 :
TEvent; A
:B C
IEventD J
;J K
} 
}		 Ï
fC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Domain\Events\IEventHandler.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Domain #
.# $
Events$ *
{ 
public 

	interface 
IEventHandler "
<" #
in# %
TEvent& ,
>, -
:- . 
INotificationHandler/ C
<C D
TEventD J
>J K
whereL Q
TEventR X
:Y Z
IEvent[ a
{ 
} 
} ë
`C:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Domain\Queries\IQuery.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Domain #
.# $
Queries$ +
{ 
public 

	interface 
IQuery 
< 
out 
	TResponse  )
>) *
:+ ,
IRequest- 5
<5 6
	TResponse6 ?
>? @
{ 
} 
} ˚
cC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Domain\Queries\IQueryBus.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Domain #
.# $
Queries$ +
{ 
public 

	interface 
	IQueryBus 
{ 
Task 
< 
	TResponse 
> 
Send 
< 
TQuery #
,# $
	TResponse% .
>. /
(/ 0
TQuery0 6
query7 <
)< =
where> C
TQueryD J
:K L
IQueryM S
<S T
	TResponseT ]
>] ^
;^ _
} 
}		 Í
gC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Domain\Queries\IQueryHandler.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Domain #
.# $
Queries$ +
{ 
public 

	interface 
IQueryHandler "
<" #
in# %
TQuery& ,
,, -
	TResponse. 7
>7 8
:9 :
IRequestHandler; J
<J K
TQueryK Q
,Q R
	TResponseS \
>\ ]
where^ c
TQueryd j
:k l
IQuerym s
<s t
	TResponset }
>} ~
{ 
} 
} †

jC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Infrastructure\Queries\QueryBus.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Infrastructure +
.+ ,
Queries, 3
{ 
public 

class 
QueryBus 
: 
	IQueryBus %
{ 
private		 
readonly		 
	IMediator		 "
	_mediator		# ,
;		, -
public 
QueryBus 
( 
	IMediator !
mediator" *
)* +
{ 	
	_mediator 
= 
mediator  
;  !
} 	
public 
Task 
< 
	TResponse 
> 
Send #
<# $
TQuery$ *
,* +
	TResponse, 5
>5 6
(6 7
TQuery7 =
query> C
)C D
whereE J
TQueryK Q
:R S
IQueryT Z
<Z [
	TResponse[ d
>d e
{ 	
return 
	_mediator 
. 
Send !
(! "
query" '
)' (
;( )
} 	
} 
} Æ
hC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\ValueObject\StringValueObject.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
ValueObject (
{ 
public		 

class		 
StringValueObject		 "
{

 
	protected 
string 
value 
; 
	protected 
StringValueObject #
(# $
string$ *
value+ 0
)0 1
{ 	
this 
. 
value 
= 
value 
; 
} 	
public 
virtual 
string 
Value #
=>$ &
value' ,
;, -
} 
} ≈
`C:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Application\UserCreator.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Application &
{ 
public 

class 
UserCreator 
{		 
private

 
readonly

 
IUserRepository

 (
_userRepository

) 8
;

8 9
private 
readonly 
	IEventBus "
	_mediator# ,
;, -
public 
UserCreator 
( 
	IEventBus $
mediator% -
,- .
IUserRepository/ >
userRepository? M
)M N
{ 	
	_mediator 
= 
mediator  
;  !
_userRepository 
= 
userRepository ,
;, -
} 	
public 
async 
Task 

CreateUser $
($ %
UserId% +
id, .
,. /
string0 6
name7 ;
); <
{ 	
var 
user 
= 
	UserClass  
.  !
Create! '
(' (
id( *
,* +
name, 0
)0 1
;1 2
await 
_userRepository !
.! "
Save" &
(& '
user' +
)+ ,
;, -
await 
	_mediator 
. 
Publish #
(# $
user$ (
.( )
PullDomainEvents) 9
(9 :
): ;
); <
;< =
} 	
} 
} Ω	
_C:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Application\UserFinder.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Application &
{ 
public 

class 

UserFinder 
{ 
private		 
readonly		 
DomainUserFinder		 )
_domainUserFinder		* ;
;		; <
public

 

UserFinder

 
(

 
IUserRepository

 )
userRepository

* 8
)

8 9
{ 	
_domainUserFinder 
= 
new  #
DomainUserFinder$ 4
(4 5
userRepository5 C
)C D
;D E
} 	
public 
async 
Task 
< 
Domain  
.  !
User! %
>% &
GetUserById' 2
(2 3
string3 9
id: <
)< =
{ 	
return 
await 
_domainUserFinder *
.* +
GetUserById+ 6
(6 7
id7 9
)9 :
;: ;
} 	
} 
} ª
YC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Domain\Company.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Domain #
.# $
Models$ *
{ 
public 

class 
Company 
{ 
public 
virtual 
int 
Id 
{ 
get  #
;# $
set% (
;( )
}* +
public 
virtual 
string 
Name "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
}		 ≠
UC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Domain\Job.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Domain #
.# $
Models$ *
{ 
public 

class 
Job 
{ 
public 
virtual 
int 
Id 
{ 
get  #
;# $
	protected% .
set/ 2
;2 3
}4 5
public		 
virtual		 
string		 
Name		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public 
virtual 
Company 
Company &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
virtual 
JobType 
JobType &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
virtual 
User 
. 
Domain "
." #
User# '
User( ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
virtual 
	JobStatus  
	JobStatus! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
virtual 
IList 
< 
Team !
>! "
Teams# (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} ø
[C:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Domain\JobStatus.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Domain #
.# $
Models$ *
{ 
public 

class 
	JobStatus 
{ 
public 
virtual 
int 
Id 
{ 
get  #
;# $
set% (
;( )
}* +
public 
virtual 
string 
Name "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
}		 ª
YC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Domain\JobType.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Domain #
.# $
Models$ *
{ 
public 

class 
JobType 
{ 
public 
virtual 
int 
Id 
{ 
get  #
;# $
set% (
;( )
}* +
public 
virtual 
string 
Name "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
}		 ß
VC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Shared\Domain\Team.cs
	namespace 	
ConsoleApp2
 
. 
Shared 
. 
Domain #
.# $
Models$ *
{ 
public 

class 
Team 
{ 
public 
virtual 
int 
Id 
{ 
get  #
;# $
	protected% .
set/ 2
;2 3
}4 5
public 
virtual 
string 
Name "
{# $
get% (
;( )
set* -
;- .
}/ 0
public		 
virtual		 
IList		 
<		 
Job		  
>		  !
Jobs		" &
{		' (
get		) ,
;		, -
set		. 1
;		1 2
}		3 4
}

 
} €
cC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Application\UserUpdateName.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Application &
{ 
public 

class 
UserUpdateName 
{ 
private		 
readonly		 
	IEventBus		 "
	_eventBus		# ,
;		, -
private

 
readonly

 
IUserRepository

 (
_userRepository

) 8
;

8 9
private 
readonly 
Domain 
.  
Queries  '
.' (

UserFinder( 2
_userFinder3 >
;> ?
public 
UserUpdateName 
( 
	IEventBus '
eventBus( 0
,0 1
IUserRepository2 A
userRepositoryB P
)P Q
{ 	
	_eventBus 
= 
eventBus  
;  !
_userRepository 
= 
userRepository ,
;, -
_userFinder 
= 
new 
Domain $
.$ %
Queries% ,
., -

UserFinder- 7
(7 8
userRepository8 F
)F G
;G H
} 	
public 
async 
Task 
UpdateUserNameAsync -
(- .
string. 4
id5 7
,7 8
string9 ?
name@ D
)D E
{ 	
var 
user 
= 
await 
_userFinder (
.( )
GetUserById) 4
(4 5
id5 7
)7 8
;8 9
user 
. 

UpdateName 
( 
name  
)  !
;! "
await 
_userRepository !
.! "
Save" &
(& '
user' +
)+ ,
;, -
await 
	_eventBus 
. 
Publish #
(# $
user$ (
.( )
PullDomainEvents) 9
(9 :
): ;
); <
;< =
} 	
} 
} •
nC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Domain\Events\UserCreatedEventHandler.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Domain !
.! "
Events" (
{		 
public

 

class

 #
UserCreatedEventHandler

 (
:

) *
IEventHandler

+ 8
<

8 9
UserCreatedEvent

9 I
>

I J
{ 
private 
readonly 
	IQueryBus "
	_queryBus# ,
;, -
public #
UserCreatedEventHandler &
(& '
	IQueryBus' 0
queryBus1 9
)9 :
{ 	
	_queryBus 
= 
queryBus  
;  !
} 	
public 
Task 
Handle 
( 
UserCreatedEvent +
notification, 8
,8 9
CancellationToken: K
cancellationTokenL ]
)] ^
{ 	
Console 
. 
	WriteLine 
( 
$"  $
UserCreatedEventHandler   8
{8 9
notification: F
.F G
IdG I
}I J
 - J M
{M N
notificationO [
.[ \
Name\ `
}a b
"b c
)c d
;d e
var $
userByIdQueryAsyncResult (
=) *
	_queryBus+ 4
.4 5
Send5 9
<9 :
UserByIdQueryAsync: L
,L M$
UserByIdQueryAsyncResultN f
>f g
(g h
newh k
UserByIdQueryAsyncl ~
(~ 
)	 Ä
)
Ä Å
.
Å Ç
Result
Ç à
;
à â
return 
Task 
. 
CompletedTask %
;% &
} 	
} 
} €

fC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Domain\Events\UserNameUpdated.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Domain !
.! "
Events" (
{		 
public

 

class

 
UserNameUpdated

  
:

  !
IEvent

" (
{ 
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
PreviousName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
NewName 
{ 
get  #
;# $
set% (
;( )
}* +
public 
UserNameUpdated 
( 
string %
userId& ,
,, -
string. 4
previousName5 A
,A B
stringC I
newNameJ Q
)Q R
{ 	
UserId 
= 
userId 
; 
PreviousName 
= 
previousName '
;' (
NewName 
= 
newName 
; 
} 	
} 
} ¸
jC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Domain\Queries\UserByIdQueryAsync.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Domain !
.! "
Queries" )
{ 
public 

class 
UserByIdQueryAsync #
:# $
IQuery% +
<+ ,$
UserByIdQueryAsyncResult, D
>D E
{ 
public 
long 
Id 
{ 
get 
; 
set !
;! "
}# $
}		 
}

 

qC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Domain\Queries\UserByIdQueryAsyncHandler.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Domain !
.! "
Queries" )
{ 
public 

class %
UserByIdQueryAsyncHandler *
:+ ,
IQueryHandler- :
<: ;
UserByIdQueryAsync; M
,M N$
UserByIdQueryAsyncResultO g
>g h
{ 
public		 
async		 
Task		 
<		 $
UserByIdQueryAsyncResult		 2
>		2 3
Handle		4 :
(		: ;
UserByIdQueryAsync		; M
request		N U
,		U V
CancellationToken		W h
cancellationToken		i z
)		z {
{

 	
return 
await 
Task 
. 
Run !
(! "
(" #
)# $
=>% '
new( +$
UserByIdQueryAsyncResult, D
{E F
IdG I
=J K
$numL P
,P Q
NameR V
=W X
$"Y [
Description [ g
{g h
requesth o
.o p
Idp r
}r s
"s t
}u v
)v w
;w x
} 	
} 
} π
pC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Domain\Queries\UserByIdQueryAsyncResult.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Domain !
.! "
Queries" )
{ 
public 

class $
UserByIdQueryAsyncResult )
{ 
public 
long 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
} 
}		 ó
TC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Domain\User.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Domain !
{ 
public 

class 
User 
: 
AggregateRoot $
{ 
public 
virtual 
string 
Id  
{! "
get# &
;& '
	protected( 1
set2 5
;5 6
}7 8
public		 
virtual		 
string		 
Name		 "
{		# $
get		% (
;		( )
	protected		+ 4
set		5 8
;		8 9
}		: ;
	protected 
User 
( 
) 
{ 
} 
	protected 
User 
( 
string 
id  
,  !
string" (
name) -
)- .
{ 	
Id 
= 
id 
; 
Name 
= 
name 
; 
} 	
public 
User 
( 
UserId 
id 
, 
string %
name& *
)* +
{ 	
Id 
= 
id 
. 
Value 
; 
Name 
= 
name 
; 
} 	
public 
static 
User 
Create !
(! "
UserId" (
id) +
,+ ,
string- 3
name4 8
)8 9
{ 	
var 
user 
= 
new 
User 
(  
id  "
." #
Value# (
,( )
name* .
). /
;/ 0
user 
. 
Record 
( 
notification $
:$ %
new& )
UserCreatedEvent* :
{; <
Id= ?
=@ A
idB D
.D E
ValueE J
,J K
NameL P
=Q R
nameS W
}X Y
)Y Z
;Z [
return 
user 
; 
}   	
public"" 
virtual"" 
void"" 

UpdateName"" &
(""& '
string""' -
name"". 2
)""2 3
{## 	
Record$$ 
($$ 
new$$ 
UserNameUpdated$$ &
($$& '
Id$$' )
,$$) *
Name$$+ /
,$$/ 0
name$$1 5
)$$5 6
)$$6 7
;$$7 8
Name%% 
=%% 
name%% 
;%% 
}&& 	
})) 
}** Ã
gC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Domain\Events\UserCreatedEvent.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Domain !
.! "
Events" (
{ 
public 

class 
UserCreatedEvent !
:! "
IEvent# )
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
}

 
} ã
bC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Domain\Queries\UserFinder.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Domain !
.! "
Queries" )
{ 
public 

class 

UserFinder 
{ 
private 
readonly 
IUserRepository (
_userRepository) 8
;8 9
public 

UserFinder 
( 
IUserRepository )
userRepository* 8
)8 9
{		 	
_userRepository

 
=

 
userRepository

 ,
;

, -
} 	
public 
async 
Task 
< 
User 
> 
GetUserById  +
(+ ,
string, 2
id3 5
)5 6
{ 	
var 
user 
= 
await 
_userRepository ,
., -
Find- 1
(1 2
id2 4
)4 5
.5 6
ConfigureAwait6 D
(D E
falseE J
)J K
;K L
if 
( 
user 
== 
null 
) 
{ 
throw 
new 
UserNotFound &
(& '
id' )
)) *
;* +
} 
return 
user 
; 
} 	
} 
} ˙
VC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Domain\UserId.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Domain !
{ 
public 

class 
UserId 
: 
StringValueObject *
{ 
public		 
UserId		 
(		 
string		 
id		 
)		  
:		  !
base		" &
(		& '
id		' )
)		) *
{

 	
Validate 
( 
id 
) 
; 
} 	
private 
void 
Validate 
( 
string $
id% '
)' (
{ 	
if 
( 
! 
IsEmail 
( 
id 
) 
) 
{ 
throw 
new 
ArgumentException +
(+ ,
$str, I
)I J
;J K
} 
} 	
private 
bool 
IsEmail 
( 
string #
id$ &
)& '
{ 	
try 
{ 
var 
addr 
= 
new 
System %
.% &
Net& )
.) *
Mail* .
.. /
MailAddress/ :
(: ;
id; =
)= >
;> ?
return 
addr 
. 
Address #
==$ &
id' )
;) *
} 
catch 
{ 
return   
false   
;   
}!! 
}"" 	
}$$ 
}%% ë
\C:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Domain\UserNotFound.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Domain !
{ 
public 

class 
UserNotFound 
: 
	Exception (
{ 
public 
UserNotFound 
( 
string "
id# %
)% &
:' (
base) -
(- .
$". 0
User 0 5
{5 6
id6 8
}8 9

 not found9 C
"C D
,D E
newF I
ArgumentExceptionJ [
([ \
)\ ]
)] ^
{_ `
}a b
} 
}		 ÷
iC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Infrastructure\Models\CompanyMap.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Infrastructure )
.) *
Models* 0
{ 
public 

class 

CompanyMap 
: 
ClassMap %
<% &
Company& -
>- .
{		 
public

 

CompanyMap

 
(

 
)

 
{ 	
Id 
( 
x 
=> 
x 
. 
Id 
) 
; 
Map 
( 
x 
=> 
x 
. 
Name 
) 
; 
} 	
} 
} Ì
eC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Infrastructure\Models\JobMap.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Infrastructure )
.) *
Models* 0
{ 
public 

class 
JobMap 
: 
ClassMap "
<" #
Job# &
>& '
{ 
public 
JobMap 
( 
) 
{		 	
Id

 
(

 
x

 
=>

 
x

 
.

 
Id

 
)

 
;

 
Map 
( 
x 
=> 
x 
. 
Name 
) 
; 

References 
( 
x 
=> 
x 
. 
Company %
)% &
;& '

References 
( 
x 
=> 
x 
. 
JobType %
)% &
;& '

References 
( 
x 
=> 
x 
. 
User "
)" #
;# $

References 
( 
x 
=> 
x 
. 
	JobStatus '
)' (
;( )
HasManyToMany 
( 
x 
=> 
x  
.  !
Teams! &
)& '
. 
Cascade 
. 
All 
( 
) 
. 
Table 
( 
$str  
)  !
;! "
} 	
} 
} ﬁ
kC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Infrastructure\Models\JobStatusMap.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Infrastructure )
.) *
Models* 0
{ 
public 

class 
JobStatusMap 
: 
ClassMap '
<' (
	JobStatus( 1
>1 2
{ 
public 
JobStatusMap 
( 
) 
{		 	
Id

 
(

 
x

 
=>

 
x

 
.

 
Id

 
)

 
;

 
Map 
( 
x 
=> 
x 
. 
Name 
) 
; 
} 	
} 
} ÷
iC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Infrastructure\Models\JobTypeMap.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Infrastructure )
.) *
Models* 0
{ 
public 

class 

JobTypeMap 
: 
ClassMap %
<% &
JobType& -
>- .
{ 
public 

JobTypeMap 
( 
) 
{		 	
Id

 
(

 
x

 
=>

 
x

 
.

 
Id

 
)

 
;

 
Map 
( 
x 
=> 
x 
. 
Name 
) 
; 
} 	
} 
} ◊	
fC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Infrastructure\Models\TeamMap.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Infrastructure )
.) *
Models* 0
{ 
public 

class 
TeamMap 
: 
ClassMap #
<# $
Team$ (
>( )
{ 
public		 
TeamMap		 
(		 
)		 
{

 	
Id 
( 
x 
=> 
x 
. 
Id 
) 
; 
Map 
( 
x 
=> 
x 
. 
Name 
) 
; 
HasManyToMany 
( 
x 
=> 
x  
.  !
Jobs! %
)% &
. 
Cascade 
. 
All 
( 
) 
. 
Inverse 
( 
) 
. 
Table 
( 
$str  
)  !
;! "
} 	
} 
} Ì
fC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Infrastructure\Models\UserMap.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Infrastructure )
.) *
Models* 0
{ 
public 

class 
UserMap 
: 
ClassMap "
<" #
Domain# )
.) *
User* .
>. /
{ 
public 
UserMap 
( 
) 
{ 
Id		 
(		 
x		 
=>		 
x		 
.		 
Id		 
)		 
;		 
Map

 
(

 
x

 
=>

 
x

 
.

 
Name

 
)

 
;

 
} 	
} 
} Ê"
KC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Program.cs
	namespace 	
ConsoleApp2
 
{ 
class 	
Program
 
{ 
static 
void 
Main 
( 
string 
[  
]  !
args" &
)& '
{ 	
var 
	container 
= 
	Container %
(% &
)& '
;' (
using 
( 
var 
scope 
= 
	container '
.' (
BeginLifetimeScope( :
(: ;
); <
)< =
{ 
var 
userId 
= 
new  
UserId! '
(' (
$str( =
)= >
;> ?
scope 
. 
Resolve 
< 
UserCreator )
>) *
(* +
)+ ,
., -

CreateUser- 7
(7 8
userId8 >
,> ?
$str@ O
)O P
.P Q
WaitQ U
(U V
)V W
;W X
} 
Console 
. 
ReadKey 
( 
) 
; 
} 	
static 
private 

IContainer !
	Container" +
(+ ,
), -
{ 	
string 
connectionString #
=$ % 
ConfigurationManager& :
.: ;
ConnectionStrings; L
[L M
$strM V
]V W
.W X
ConnectionStringX h
;h i
var!! 
builder!! 
=!! 
new!! 
ContainerBuilder!! .
(!!. /
)!!/ 0
;!!0 1
builder"" 
."" 
RegisterType""  
<""  !
Mediator""! )
>"") *
(""* +
)""+ ,
.## 
As## 
<## 
	IMediator##  
>##  !
(##! "
)##" #
.$$ $
InstancePerLifetimeScope$$ ,
($$, -
)$$- .
;$$. /
builder'' 
.'' 
Register'' 
<'' 
ServiceFactory'' +
>''+ ,
('', -
context''- 4
=>''5 7
{(( 
var)) 
c)) 
=)) 
context)) 
.))  
Resolve))  '
<))' (
IComponentContext))( 9
>))9 :
()): ;
))); <
;))< =
return** 
t** 
=>** 
c** 
.** 
Resolve** %
(**% &
t**& '
)**' (
;**( )
}++ 
)++ 
;++ 
builder-- 
.-- 
RegisterType--  
<--  !
UserUpdateName--! /
>--/ 0
(--0 1
)--1 2
;--2 3
builder.. 
... 
RegisterType..  
<..  !
UserCreator..! ,
>.., -
(..- .
)... /
;../ 0
builder// 
.// 
RegisterType//  
<//  !$
NotifyUserCreatedHandler//! 9
>//9 :
(//: ;
)//; <
.//< =#
AsImplementedInterfaces//= T
(//T U
)//U V
.//V W!
InstancePerDependency//W l
(//l m
)//m n
;//n o
builder00 
.00 
Register00 
(00 
c00 
=>00 !
new00" %
EventBus00& .
(00. /
c00/ 0
.000 1
Resolve001 8
<008 9
	IMediator009 B
>00B C
(00C D
)00D E
)00E F
)00F G
.00G H
As00H J
<00J K
	IEventBus00K T
>00T U
(00U V
)00V W
;00W X
builder11 
.11 
Register11 
(11 
_11 
=>11 !
new11" %"
UserPostgresRepository11& <
(11< =
connectionString11= M
)11M N
)11N O
.11O P
As11P R
<11R S
IUserRepository11S b
>11b c
(11c d
)11d e
;11e f
return33 
builder33 
.33 
Build33  
(33  !
)33! "
;33" #
}44 	
}55 
}66 Ü
[C:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str &
)& '
]' (
[		 
assembly		 	
:			 

AssemblyDescription		 
(		 
$str		 !
)		! "
]		" #
[

 
assembly

 	
:

	 
!
AssemblyConfiguration

  
(

  !
$str

! #
)

# $
]

$ %
[ 
assembly 	
:	 

AssemblyCompany 
( 
$str 
) 
] 
[ 
assembly 	
:	 

AssemblyProduct 
( 
$str (
)( )
]) *
[ 
assembly 	
:	 

AssemblyCopyright 
( 
$str 0
)0 1
]1 2
[ 
assembly 	
:	 

AssemblyTrademark 
( 
$str 
)  
]  !
[ 
assembly 	
:	 

AssemblyCulture 
( 
$str 
) 
] 
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] 
[ 
assembly 	
:	 

Guid 
( 
$str 6
)6 7
]7 8
[## 
assembly## 	
:##	 

AssemblyVersion## 
(## 
$str## $
)##$ %
]##% &
[$$ 
assembly$$ 	
:$$	 

AssemblyFileVersion$$ 
($$ 
$str$$ (
)$$( )
]$$) *Ì
_C:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Domain\IUserRepository.cs
	namespace 	
ConsoleApp2
 
. 
User 
. 
Domain !
{ 
public 

	interface 
IUserRepository $
{ 
Task 
Save 
( 
User 
user 
) 
; 
Task

 
<

 
User

 
>

 
Find

 
(

 
string

 
id

 !
)

! "
;

" #
} 
} ∞
yC:\Users\alejandro.gonzalez\source\repos\ConsoleApp2\ConsoleApp2\User\Infrastructure\Repository\UserPostgresRepository.cs
	namespace		 	
ConsoleApp2		
 
.		 
User		 
.		 

Repository		 %
{

 
public 

class "
UserPostgresRepository '
:( )
IUserRepository* 9
{ 
private 
readonly 
ISessionFactory (
_sessionFactory) 8
;8 9
private 
readonly 
Configuration &
_configuration' 5
;5 6
public "
UserPostgresRepository %
(% &
string& ,
connectionString- =
)= >
{ 	
_configuration 
= 
Fluently %
.% &
	Configure& /
(/ 0
)0 1
. 
Database 
( #
PostgreSQLConfiguration 1
.1 2
PostgreSQL822 >
.> ?
ConnectionString? O
(O P
connectionStringP `
)` a
.a b
ShowSqlb i
)i j
. 
Mappings 
( 
m 
=> 
m  
.  !
FluentMappings! /
./ 0
AddFromAssemblyOf0 A
<A B
JobMapB H
>H I
(I J
)J K
)K L
. 
BuildConfiguration #
(# $
)$ %
;% &
_sessionFactory 
= 
_configuration ,
., -
BuildSessionFactory- @
(@ A
)A B
;B C
} 	
public 
async 
Task 
Save 
( 
Domain %
.% &
User& *
user+ /
)/ 0
{ 	
using 
( 
var 
session 
=  
_sessionFactory! 0
.0 1
OpenSession1 <
(< =
)= >
)> ?
using 
( 
var 
transaction "
=# $
session% ,
., -
BeginTransaction- =
(= >
)> ?
)? @
{ 
await 
session 
. 
SaveOrUpdateAsync /
(/ 0
user0 4
)4 5
;5 6
await   
transaction   !
.  ! "
CommitAsync  " -
(  - .
)  . /
;  / 0
}!! 
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
Domain$$  
.$$  !
User$$! %
>$$% &
Find$$' +
($$+ ,
string$$, 2
id$$3 5
)$$5 6
{%% 	
using&& 
(&& 
var&& 
session&& 
=&&  
_sessionFactory&&! 0
.&&0 1
OpenSession&&1 <
(&&< =
)&&= >
)&&> ?
{'' 
return(( 
await(( 
session(( $
.(($ %
GetAsync((% -
<((- .
Domain((. 4
.((4 5
User((5 9
>((9 :
(((: ;
id((; =
)((= >
.((> ?
ConfigureAwait((? M
(((M N
false((N S
)((S T
;((T U
})) 
}** 	
}++ 
},, 