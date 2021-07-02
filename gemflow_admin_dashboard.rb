require 'watir'
require 'selenium-webdriver'
require 'securerandom'

Selenium::WebDriver::Chrome.driver_path='/home/administrator/Downloads/chromedriver'
browser = Watir::Browser.start 'http://localhost:3001/auth/login'

# login begins

text = browser.text_field :id=> 'formGroupEmail'
text.exist?
text.set 'alen@zeefasys.com'

button = browser.button(value: 'Sign in')
button.text == 'Sign in'
button.click

text = browser.text_field :id=> 'okta-signin-username'
text.exist?
text.set 'alen@zeefasys.com'

text = browser.text_field :id=> 'okta-signin-password'
text.exist?
text.set '#a123456'

button = browser.button(value: 'Sign In')
button.text == 'Sign In'
button.click

# login ends

# facilities begins

browser.image(:id => "facilityAdd").click

browser.text_field(:name=> 'hospitalName').set 'hospital123'
browser.text_field(:name=> 'physicalAddress').set 'address123'
browser.text_field(:name=> 'city').set 'city123'
browser.select_list(:name => 'state').select('Alabama')
browser.text_field(:name=> 'zip').set '12345'
browser.select_list(:name => 'timeZone').select('US/Alaska')
browser.text_field(:name=> 'facilityId').set 'facility123'
browser.text_field(:name=> 'facilityContactName').set 'contact123'
browser.text_field(:name=> 'email').set 'alen+50@gmail.com'
browser.text_field(:name=> 'phone').set '9400737999'
browser.text_field(:name=> 'mcaRepName').set 'mcarep123'

button = browser.button(value: 'Add')
button.text == 'Add'
button.click

browser.div(:name => "hospital123").when_present.click

# browser.div(:id => "facilityEdit").click

# browser.div(:id => "facilityRemove").click

# button = browser.button(value: 'Yes, remove it!')
# button.text == 'Yes, remove it!'
# button.click

# facilities ends

# monitors begins
num = rand.to_s[2..5] 
monitor_id = 'MONITOR'+num
cloud_id = 'CLOUD'+num

Watir.default_timeout = 5
browser.image(:id => "monitorAdd").when_present.click

browser.text_field(:name=> 'cloud_id').set cloud_id
browser.text_field(:name=> 'monitor_id').set monitor_id
browser.text_field(:name=> 'auto_log_level').set '123'

button = browser.button(value: 'Add')
button.text == 'Add'
button.click
sleep 10
#monitor details begin
#---------------

browser.div(:name => monitor_id).when_present.click
sleep 5
browser.span(:id => "getnewaudio", disabled: false).click
sleep 10
browser.select_list(:id => 'monitorActivityTime', disabled: false).select 'All'
sleep 5
browser.select_list(:id => 'monitorActivityTime', disabled: false).select 'Last 12 hour'
sleep 5
browser.select_list(:id => 'monitorActivityTime', disabled: false).select 'Last 1 hour'
sleep 5
browser.select_list(:id => 'monitorActivityTime', disabled: false).select 'Last 3 days'
sleep 5
browser.select_list(:id => 'monitorActivityTime', disabled: false).select 'Last 5 days'
sleep 5
browser.select_list(:id => 'monitorActivityTime', disabled: false).select 'Last 7 days'
sleep 5
browser.span(:id => "getmonitorlog", disabled: false).click
sleep 10
browser.select_list(:id => 'cloudActivityTime', disabled: false).select 'Last 12 hour'
sleep 5
browser.select_list(:id => 'cloudActivityTime', disabled: false).select 'Last 1 hour'
sleep 5
browser.select_list(:id => 'cloudActivityTime', disabled: false).select 'Last 3 days'
sleep 5
browser.select_list(:id => 'cloudActivityTime', disabled: false).select 'Last 5 days'
sleep 5
browser.select_list(:id => 'cloudActivityTime', disabled: false).select 'Last 7 days'
sleep 5
# browser.span(:id => "getcloudlog", disabled: false).click
# sleep 10
browser.p(:id => "monitorBack", disabled: false).click

#monitor details end
#---------------

browser.div(:name => monitor_id+"Edit").wait_until(&:present?).click
sleep 5
browser.select_list(:name=> 'facility').wait_until_present.select ''
browser.button(:id => 'apply').click
sleep 5

browser.div(:id => "all").click
sleep 2
browser.text_field(:id => "monitor_search").set monitor_id
browser.div(:name => monitor_id+"Edit").wait_until(&:present?).click

browser.div(:id => "monitorRemove").when_present.click
button = browser.button(value: 'Yes, remove it!')
button.text == 'Yes, remove it!'
button.click
sleep 5

# monitor ends

# user begins
browser.div(:name => "hospital123").when_present.click
browser.span(:id => "userSelect").when_present.click
browser.image(:id => "userAdd").when_present.click

browser.text_field(:name=> 'fname').set 'alen'
browser.text_field(:name=> 'lname').set 'thomas'
browser.text_field(:name=> 'email').set 'alen+111@zeefasys.com'
browser.text_field(:name=> 'phone').set '9400737999'

button = browser.button(value: 'Add')
button.text == 'Add'
button.click

sleep 10

browser.div(:id => "alen+111@zeefasys.com").when_present.click
browser.div(:id => 'demo-mutiple-checkbox').click
browser.li(:id => 'hospital123').click
browser.body(:id => 'kt_body').click
button = browser.button(value: 'Apply')
button.text == 'Apply'
button.click
sleep 15

browser.div(:id => "all").click
sleep 5
browser.text_field(:id => "user_search").set 'alen+111@zeefasys.com'
sleep 3
browser.div(:id => "alen+111@zeefasys.com").when_present.click
browser.div(:id => "userRemove").click

button = browser.button(value: 'Yes, remove it!')
button.text == 'Yes, remove it!'
button.click
# browser.div(:id => 'demo-mutiple-checkbox').click
# browser.li(:id => 'hospital123').click
# browser.body(:id => 'kt_body').click
# button = browser.button(value: 'Apply')
# button.text == 'Apply'
# button.click
sleep 15

browser.div(:name => "hospital123").when_present.click
browser.div(:id => "facilityEdit").click

browser.div(:id => "facilityRemove").click

button = browser.button(value: 'Yes, remove it!')
button.text == 'Yes, remove it!'
button.click

sleep 15

# user ends
