#the best way to install RSelenium :
# 1- use rsDriver At first after loading the library 
# 2- use "firefox" NOT "chrome"


#Loading the driver using "firefox"
rD<-rsDriver(browser = c('firefox'))


#using Clients 
RemDr<-rD$client

#Navigate to certain webpage
RemDr$navigate('https://twitter.com/realDonaldTrump?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor')

# the next steps are to login to my account 
## allocating the username field 
user_Name<-RemDr$findElement(using = 'css',value = 'html body.three-col.logged-out.user-style-realDonaldTrump.ms-windows.enhanced-mini-profile.ProfilePage.ProfilePage--withWarning.no-nav-banners.supports-drag-and-drop.dropdown-enabled div#doc.route-profile div.topbar.js-topbar div.global-nav.global-nav--newLoggedOut div.global-nav-inner div.container div.pull-right.nav-extras ul#session.nav.secondary-nav.session-dropdown li.dropdown.js-session.open div#signin-dropdown.dropdown-menu.dropdown-form.dropdown-menu--rightAlign.is-forceRight div.signin-dialog-body form.LoginForm.js-front-signin div.LoginForm-input.LoginForm-username input.text-input.email-input.js-signin-email')

## using the field to write the username 
user_Name$sendKeysToElement(list('vet_mo2men'))

##allocating the password field 
password<-RemDr$findElement(using = 'css',value = 'html body.three-col.logged-out.user-style-realDonaldTrump.ms-windows.enhanced-mini-profile.ProfilePage.ProfilePage--withWarning.no-nav-banners.supports-drag-and-drop.dropdown-enabled div#doc.route-profile div.topbar.js-topbar div.global-nav.global-nav--newLoggedOut div.global-nav-inner div.container div.pull-right.nav-extras ul#session.nav.secondary-nav.session-dropdown li.dropdown.js-session.open div#signin-dropdown.dropdown-menu.dropdown-form.dropdown-menu--rightAlign.is-forceRight div.signin-dialog-body form.LoginForm.js-front-signin div.LoginForm-input.LoginForm-password input.text-input')

## using the field to write the password
password$sendKeysToElement(list('salsa2762013'))

## allocating the field of clicking and using it to click pressing login
login<-RemDr$findElement(using = 'css',value = 'html body.three-col.logged-out.user-style-realDonaldTrump.ms-windows.enhanced-mini-profile.ProfilePage.ProfilePage--withWarning.no-nav-banners.supports-drag-and-drop.dropdown-enabled div#doc.route-profile div.topbar.js-topbar div.global-nav.global-nav--newLoggedOut div.global-nav-inner div.container div.pull-right.nav-extras ul#session.nav.secondary-nav.session-dropdown li.dropdown.js-session.open div#signin-dropdown.dropdown-menu.dropdown-form.dropdown-menu--rightAlign.is-forceRight div.signin-dialog-body form.LoginForm.js-front-signin input.EdgeButton.EdgeButton--primary.EdgeButton--medium.submit.js-submit')
login$clickElement() 

#allocating tweets in an object
tweets<-RemDr$findElements(using = 'xpath',value = '/html/body/div/div/div/div/div/div/div/div/div/div/div/div/ol/li/div/div/div/p')

#Extracting the element and store it to list 

Tweets<-list()

Tweets<-lapply(tweets,function(x){x$getElementText()})

TWEETS<-c(unlist(Tweets))


#############################################################
#Another Example with infinit scroll
rD<-rsDriver(browser = 'firefox')
RemDr<-rD$client
RemDr$setImplicitWaitTimeout(10000)
RemDr$navigate('https://www.otlob.com/restaurants')

load<-function(){
        body0<-NULL
        while(is.null(body0)){
                body0<-RemDr$findElement(using ='xpath',value = '/html/body' )
                body0$sendKeysToElement(list(key='end'))
        }
}


repeat {
        startTime <- Sys.time()
        load()
        sleepTime <- startTime + 2 - Sys.time()
        if (sleepTime > 0)
                Sys.sleep(sleepTime)
}


res_name<-RemDr$findElements(using = 'css',value = 'html.desktop.js body.whitelabel.whitelabel-on-main-domain.no-foodpanda.eg div.page-wrapper.js-sticky-height-calculate-container div.content-wrapper main.js-sticky-height-calculate-container div.container div.vendors div.vendors__inner.js-sticky-height-calculate-container form.js-vendor-list-form div.row section.vendor-list.js-infscroll-container section.js-infscroll-load-more-here article.vendor.list.js-vendor-list-vendor-panel a.vendor__inner.js-fire-click-tracking-event div.vendor__details div.vendor__title span.vendor__name')

res_names<-list()
res_names<-c(unlist(sapply(res_name,function(x){
        x$getElementText()
})))

