{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red89\green138\blue67;\red23\green23\blue23;\red202\green202\blue202;
\red194\green126\blue101;\red183\green111\blue179;\red212\green214\blue154;\red167\green197\blue152;\red70\green137\blue204;
\red140\green211\blue254;\red67\green192\blue160;}
{\*\expandedcolortbl;;\cssrgb\c41569\c60000\c33333;\cssrgb\c11765\c11765\c11765;\cssrgb\c83137\c83137\c83137;
\cssrgb\c80784\c56863\c47059;\cssrgb\c77255\c52549\c75294;\cssrgb\c86275\c86275\c66667;\cssrgb\c70980\c80784\c65882;\cssrgb\c33725\c61176\c83922;
\cssrgb\c61176\c86275\c99608;\cssrgb\c30588\c78824\c69020;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 # frozen_string_literal: true\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 def_shared_example \cf5 \strokec5 "Scheduled Ordering + Order Limits for all order types"\cf4 \strokec4  \cf6 \strokec6 do\cf4 \cb1 \strokec4 \
\cb3   \cf2 \strokec2 # Given that dispensary admin is logged in\cf4 \cb1 \strokec4 \
\cb3   settings.login_as admin\cb1 \
\
\cb3   \cf2 \strokec2 # And Settings page is loaded\cf4 \cb1 \strokec4 \
\cb3   settings.\cf7 \strokec7 load\cf4 \strokec4 (dispensary: dispensary._id, tab: \cf5 \strokec5 "settings"\cf4 \strokec4 )\cb1 \
\
\cb3   \cf2 \strokec2 # And I click the Ordering tab\cf4 \cb1 \strokec4 \
\cb3   settings.subheader.tab(text: \cf5 \strokec5 "Ordering"\cf4 \strokec4 ).click\cb1 \
\
\cb3   \cf2 \strokec2 # And I click on an ordering option\cf4 \cb1 \strokec4 \
\cb3   settings.order_type.order_type_link(text: ordertype).click\cb1 \
\
\cb3   \cf2 \strokec2 # And I enable Scheduled Ordering\cf4 \cb1 \strokec4 \
\cb3   settings.ordering.pickup.ordering_options.scheduled_ordering_option.click\cb1 \
\
\cb3   \cf2 \strokec2 # And I select 30 mins each for the pickup time slot\cf4 \cb1 \strokec4 \
\cb3   settings.ordering.pickup.ordering_options.time_slots.\cf7 \strokec7 select\cf4 \strokec4 (\cf5 \strokec5 "30 minutes each"\cf4 \strokec4 )\cb1 \
\
\cb3   \cf2 \strokec2 # And I set the next available to 10 minutes\cf4 \cb1 \strokec4 \
\cb3   settings.ordering.pickup.ordering_options.next_available_time.\cf7 \strokec7 select\cf4 \strokec4 (\cf5 \strokec5 "10 minutes"\cf4 \strokec4 )\cb1 \
\
\cb3   \cf2 \strokec2 # And I enable Order Limits\cf4 \cb1 \strokec4 \
\cb3   settings.ordering.pickup.ordering_options.order_limits.toggle.click\cb1 \
\
\cb3   \cf2 \strokec2 # And I set the order limit to 1 for the 11-11:30pm slot\cf4 \cb1 \strokec4 \
\cb3   settings.ordering.pickup.ordering_options.order_limits.order_limit_time_slot(text: \cf5 \strokec5 "11:00pm - 11:30pm"\cf4 \strokec4 ).fill_in with:\cf5 \strokec5 "1"\cf4 \cb1 \strokec4 \
\
\cb3   \cf2 \strokec2 # And I click publish\cf4 \cb1 \strokec4 \
\cb3   settings.publish_button.click\cb1 \
\
\cb3   \cf2 \strokec2 # Then a green banner flashes saying you successfully updated the settings\cf4 \cb1 \strokec4 \
\cb3   settings.has_ernie?\cb1 \
\
\cb3   \cf2 \strokec2 # When I navigate to the dispensaries menu on consumer\cf4 \cb1 \strokec4 \
\cb3   menu.\cf7 \strokec7 load\cf4 \strokec4 (dispensary: dispensary, area: \cf5 \strokec5 "products"\cf4 \strokec4 , sub_area: \cf5 \strokec5 "flower"\cf4 \strokec4 )\cb1 \
\
\cb3   \cf2 \strokec2 # And add a product to the cart\cf4 \cb1 \strokec4 \
\cb3   wait_for_render\cb1 \
\cb3   menu.products.listed_product(match: :first).add_button.click\cb1 \
\
\cb3   \cf2 \strokec2 # And I select the order type on the Order Type Modal for embedded menu\cf4 \cb1 \strokec4 \
\cb3   \cf6 \strokec6 if\cf4 \strokec4  menu_context == :embedded and fulfillment == \cf5 \strokec5 "Delivery"\cf4 \cb1 \strokec4 \
\cb3     menu.order_type_modal.order_type(text: \cf5 \strokec5 "Delivery"\cf4 \strokec4 ).click\cb1 \
\cb3     menu.address_modal.save_address\cb1 \
\cb3     menu.residence_modal.yes_residence.click\cb1 \
\cb3   \cf6 \strokec6 elsif\cf4 \strokec4  menu_context == :embedded and fulfillment == \cf5 \strokec5 "Pickup"\cf4 \cb1 \strokec4 \
\cb3       menu.order_type_modal.order_type(text: \cf5 \strokec5 "Pickup"\cf4 \strokec4 ).click\cb1 \
\cb3   \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\
\cb3   \cf2 \strokec2 # And I click the button to go to checkout\cf4 \cb1 \strokec4 \
\cb3   menu.cart_pane.proceed_to_checkout.click\cb1 \
\
\cb3   \cf2 \strokec2 # Then I am navigated to the checkout page\cf4 \cb1 \strokec4 \
\cb3   expect(checkout).to be_loaded\cb1 \
\
\cb3   \cf2 \strokec2 # When I enter Customer info\cf4 \cb1 \strokec4 \
\cb3   checkout.checkout_form.enter_test_customer_information\cb1 \
\cb3   fullname = checkout.checkout_form.fname.value + \cf5 \strokec5 " "\cf4 \strokec4  + checkout.checkout_form.lname.value\cb1 \
\
\cb3   \cf2 \strokec2 # And I select the order type\cf4 \cb1 \strokec4 \
\cb3   \cf6 \strokec6 if\cf4 \strokec4  menu_context == :main and fulfillment == \cf5 \strokec5 "Delivery"\cf4 \strokec4  \cb1 \
\cb3     checkout.type.order_type_radio_button(text: type).click\cb1 \
\cb3     checkout.checkout_form.delivery_address.fill_in with: \cf5 \strokec5 "40 NE 3rd St, Bend, OR 97701"\cf4 \cb1 \strokec4 \
\cb3     wait_for_render\cb1 \
\cb3     checkout.google_suggestion_form.address_suggestion.click\cb1 \
\cb3     menu.residence_modal.yes_residence.click\cb1 \
\cb3     checkout.type.save_button.click\cb1 \
\cb3   \cf6 \strokec6 elsif\cf4 \strokec4  fulfillment == \cf5 \strokec5 "Pickup"\cf4 \cb1 \strokec4 \
\cb3       checkout.type.order_type_radio_button(text: type).click\cb1 \
\cb3       checkout.type.save_button.click\cb1 \
\cb3   \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\
\cb3   \cf2 \strokec2 # Then the time section is visible\cf4 \cb1 \strokec4 \
\cb3   expect(checkout.time).to be_loaded\cb1 \
\
\cb3   \cf2 \strokec2 # When I select Cash as payment type\cf4 \cb1 \strokec4 \
\cb3   \cf2 \strokec2 # And I select Scheduled for Later\cf4 \cb1 \strokec4 \
\cb3   checkout.time.scheduled_for_later_radio_button.click\cb1 \
\
\cb3   \cf2 \strokec2 # And I select 11-11:30 time slot for today\cf4 \cb1 \strokec4 \
\cb3   checkout.time.scheduled_day.click\cb1 \
\cb3   checkout.time.scheduled_day_option(text: \cf5 \strokec5 "Today"\cf4 \strokec4 ).click\cb1 \
\cb3   checkout.time.scheduled_time.click\cb1 \
\cb3   checkout.time.scheduled_time_option(text: \cf5 \strokec5 "11pm - 11:30pm"\cf4 \strokec4 ).click\cb1 \
\
\cb3   \cf2 \strokec2 # And I click to to complete the order\cf4 \cb1 \strokec4 \
\cb3   checkout.order_overview.place_order.click\cb1 \
\
\cb3   \cf2 \strokec2 # Then the guest success modal appears\cf4 \cb1 \strokec4 \
\cb3   expect(checkout.success_modal).to be_present\cb1 \
\
\cb3   \cf2 \strokec2 # When I click No thanks on the guess success modal\cf4 \cb1 \strokec4 \
\cb3   checkout.success_modal.dont_save_button.click\cb1 \
\
\cb3   \cf2 \strokec2 # And I navigate to the dispensaries menu on consumer\cf4 \cb1 \strokec4 \
\cb3   menu.\cf7 \strokec7 load\cf4 \strokec4 (dispensary: dispensary, area: \cf5 \strokec5 "products"\cf4 \strokec4 , sub_area: \cf5 \strokec5 "flower"\cf4 \strokec4 )\cb1 \
\
\cb3   \cf2 \strokec2 # And I add another product to the cart\cf4 \cb1 \strokec4 \
\cb3   menu.products.listed_product(match: :first).add_button.click\cb1 \
\
\cb3   \cf2 \strokec2 # And I select the order type on the Order Type Modal for embedded menu\cf4 \cb1 \strokec4 \
\cb3   \cf6 \strokec6 if\cf4 \strokec4  menu_context == :embedded and fulfillment == \cf5 \strokec5 "Delivery"\cf4 \cb1 \strokec4 \
\cb3     menu.order_type_modal.order_type(text: \cf5 \strokec5 "Delivery"\cf4 \strokec4 ).click\cb1 \
\cb3   \cf6 \strokec6 elsif\cf4 \strokec4  menu_context == :embedded and fulfillment == \cf5 \strokec5 "Pickup"\cf4 \cb1 \strokec4 \
\cb3       menu.order_type_modal.order_type(text: \cf5 \strokec5 "Pickup"\cf4 \strokec4 ).click\cb1 \
\cb3   \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\
\cb3   \cf2 \strokec2 # And I click the button to go to checkout\cf4 \cb1 \strokec4 \
\cb3   menu.cart_pane.proceed_to_checkout.click\cb1 \
\
\cb3   \cf2 \strokec2 # Then I am navigated to the checkout page\cf4 \cb1 \strokec4 \
\cb3   expect(checkout).to be_loaded\cb1 \
\
\cb3   \cf2 \strokec2 # When I enter Customer info\cf4 \cb1 \strokec4 \
\cb3   checkout.checkout_form.enter_test_customer_information\cb1 \
\
\cb3   \cf2 \strokec2 # And I select the order type\cf4 \cb1 \strokec4 \
\cb3   \cf6 \strokec6 if\cf4 \strokec4  menu_context == :main and fulfillment == \cf5 \strokec5 "Delivery"\cf4 \cb1 \strokec4 \
\cb3     checkout.type.order_type_radio_button(text: type).click\cb1 \
\cb3   \cf6 \strokec6 elsif\cf4 \strokec4  fulfillment == \cf5 \strokec5 "Pickup"\cf4 \cb1 \strokec4 \
\cb3       checkout.type.order_type_radio_button(text: type).click\cb1 \
\cb3       checkout.type.save_button.click\cb1 \
\cb3   \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\
\cb3   \cf2 \strokec2 # Then the time section is visible\cf4 \cb1 \strokec4 \
\cb3   expect(checkout.time).to be_loaded\cb1 \
\
\cb3   \cf2 \strokec2 # When I select Cash as payment type\cf4 \cb1 \strokec4 \
\cb3   \cf2 \strokec2 # And I select Scheduled for Later\cf4 \cb1 \strokec4 \
\cb3   checkout.time.scheduled_for_later_radio_button.click\cb1 \
\
\cb3   \cf2 \strokec2 # And I attempt to select 11-11:30 time slot for today\cf4 \cb1 \strokec4 \
\cb3   checkout.time.scheduled_day.click\cb1 \
\cb3   checkout.time.scheduled_day_option(text: \cf5 \strokec5 "Today"\cf4 \strokec4 ).click\cb1 \
\cb3   checkout.time.scheduled_time.click\cb1 \
\
\cb3   \cf2 \strokec2 # Then the 11-11:30 pickup/delivery slot is no longer available\cf4 \cb1 \strokec4 \
\cb3   expect(checkout.time.scheduled_time_option(text: \cf5 \strokec5 "11pm - 11:30pm (Sold out)"\cf4 \strokec4 )).to be_present\cb1 \
\
\cb3   \cf2 \strokec2 # When I navigate to the dispensary admin orders page\cf4 \cb1 \strokec4 \
\cb3   \cf2 \strokec2 # wait_for_render\cf4 \cb1 \strokec4 \
\cb3   orders.\cf7 \strokec7 load\cf4 \strokec4 (dispensary: dispensary._id)\cb1 \
\
\cb3   \cf2 \strokec2 # Then the order is present\cf4 \cb1 \strokec4 \
\cb3   expect(orders.active_order_card.customer_name[\cf8 \strokec8 0\cf4 \strokec4 ].text).to eq(fullname)\cb1 \
\
\cb3   \cf2 \strokec2 # And the pickup/delivery time slot is present in the order tile\cf4 \cb1 \strokec4 \
\cb3   expect(orders.active_order_card.scheduled_day).to be_present\cb1 \
\cb3   expect(orders.active_order_card.scheduled_time).to be_present\cb1 \
\
\cb3   \cf2 \strokec2 # When I click the confirm button\cf4 \cb1 \strokec4 \
\cb3   orders.active_order_card.confirm_button(text: \cf5 \strokec5 "CONFIRM"\cf4 \strokec4 ).click\cb1 \
\
\cb3   \cf2 \strokec2 # Then the Start Delivery/Ready for Pickup button appears\cf4 \cb1 \strokec4 \
\cb3   \cf6 \strokec6 if\cf4 \strokec4  fulfillment == \cf5 \strokec5 "Delivery"\cf4 \cb1 \strokec4 \
\cb3     expect(orders.active_order_card.fulfillment_button(text: \cf5 \strokec5 "START DELIVERY"\cf4 \strokec4 )).to be_present\cb1 \
\cb3   \cf2 \strokec2 # When I click the Start Delivery button\cf4 \cb1 \strokec4 \
\cb3     orders.active_order_card.fulfillment_button(text: \cf5 \strokec5 "START DELIVERY"\cf4 \strokec4 ).click\cb1 \
\cb3   \cf2 \strokec2 # Then the Select Driver modal appears\cf4 \cb1 \strokec4 \
\cb3     expect(orders.select_driver_modal).to be_present\cb1 \
\cb3   \cf2 \strokec2 # When I select a driver and click Continue\cf4 \cb1 \strokec4 \
\cb3     driver = admin.profile.firstName + \cf5 \strokec5 " "\cf4 \strokec4  + admin.profile.lastName\cb1 \
\cb3     orders.select_driver_modal.driver_dropdown.\cf7 \strokec7 select\cf4 \strokec4 (driver)\cb1 \
\cb3     orders.select_driver_modal.continue_button.click\cb1 \
\cb3   \cf2 \strokec2 # Then the Close Order button appears\cf4 \cb1 \strokec4 \
\cb3     expect(orders.active_order_card.fulfillment_button(text: \cf5 \strokec5 "CLOSE ORDER"\cf4 \strokec4 ))\cb1 \
\cb3   \cf2 \strokec2 # When I click the Close Order button\cf4 \cb1 \strokec4 \
\cb3     orders.active_order_card.fulfillment_button(text: \cf5 \strokec5 "CLOSE ORDER"\cf4 \strokec4 ).click\cb1 \
\cb3   \cf2 \strokec2 # And I confirm to close the order\cf4 \cb1 \strokec4 \
\cb3     orders.close_order_modal.close_order_button(text: \cf5 \strokec5 "CLOSE ORDER"\cf4 \strokec4 ).click\cb1 \
\cb3   \cf6 \strokec6 else\cf4 \cb1 \strokec4 \
\cb3   \cf2 \strokec2 # Then the Ready for Pickup button appears\cf4 \cb1 \strokec4 \
\cb3     expect(orders.active_order_card.fulfillment_button(text: \cf5 \strokec5 "READY FOR PICKUP"\cf4 \strokec4 )).to be_present\cb1 \
\cb3   \cf2 \strokec2 # When I click the Ready for Pickup button\cf4 \cb1 \strokec4 \
\cb3     orders.active_order_card.fulfillment_button(text: \cf5 \strokec5 "READY FOR PICKUP"\cf4 \strokec4 ).click\cb1 \
\cb3   \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\
\cb3   \cf2 \strokec2 # Then the order disappears from the current orders page\cf4 \cb1 \strokec4 \
\cb3   \cf2 \strokec2 # And is listed under Past orders\cf4 \cb1 \strokec4 \
\cb3   orders.click_link(text: \cf5 \strokec5 "Past"\cf4 \strokec4 )\cb1 \
\cb3   expect(orders.past_orders.customer_name.text).to eq(fullname)\cb1 \
\pard\pardeftab720\partightenfactor0
\cf6 \cb3 \strokec6 end\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 feature \cf5 \strokec5 "Scheduled Ordering Limits e2e flow"\cf4 \strokec4 , :desktop_only, :main_and_embedded \cf6 \strokec6 do\cf4 \cb1 \strokec4 \
\cb3   let(:enabled)      \{ \{enabled: \cf9 \cb3 \strokec9 true\cf4 \cb3 \strokec4 , paymentTypes: \{cash: \cf9 \cb3 \strokec9 true\cf4 \cb3 \strokec4 \}\} \}\cb1 \
\cb3   let(:menu_context) \{ |\cf10 \cb3 \strokec10 example\cf4 \cb3 \strokec4 | example.metadata[:menu_context] \}\cb1 \
\cb3   let(:admin)        \{ create(:user, :dispensary_admin, profile_attributes: \{dispensaryId: dispensary._id\}) \}\cb1 \
\cb3   let(:settings)     \{ \cf11 \cb3 \strokec11 AdminSettings\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 Page\cf4 \cb3 \strokec4 .\cf9 \cb3 \strokec9 new\cf4 \cb3 \strokec4  \}\cb1 \
\cb3   let(:orders)       \{ \cf11 \cb3 \strokec11 AdminDispensaryOrders\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 Page\cf4 \cb3 \strokec4 .\cf9 \cb3 \strokec9 new\cf4 \cb3 \strokec4  \}\cb1 \
\cb3   let(:checkout)     \{ \cf11 \cb3 \strokec11 Checkout\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 Page\cf4 \cb3 \strokec4 .\cf9 \cb3 \strokec9 new\cf4 \cb3 \strokec4  \}\cb1 \
\cb3   let!(:dispensary) \cf6 \strokec6 do\cf4 \cb1 \strokec4 \
\cb3     create(\cb1 \
\cb3       :dispensary_with_products,\cb1 \
\cb3       profile_attributes: \{\cb1 \
\cb3         featureFlags:       \{enableArrivals: \cf9 \cb3 \strokec9 true\cf4 \cb3 \strokec4 \},\cb1 \
\cb3         order_types_config: \{\cb1 \
\cb3           pickup:          enabled,\cb1 \
\cb3           curbsidePickup:  enabled,\cb1 \
\cb3           driveThruPickup: enabled,\cb1 \
\cb3           delivery:        enabled,\cb1 \
\cb3           kiosk:           enabled\cb1 \
\cb3         \}\cb1 \
\cb3       \}\cb1 \
\cb3     )\cb1 \
\cb3   \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\
\cb3   context \cf5 \strokec5 "In Store Pickup"\cf4 \strokec4  \cf6 \strokec6 do\cf4 \cb1 \strokec4 \
\cb3     let(:ordertype) \{ \cf5 \strokec5 "In-Store Pickup"\cf4 \strokec4  \}\cb1 \
\cb3     let(:fulfillment) \{ \cf5 \strokec5 "Pickup"\cf4 \strokec4  \}\cb1 \
\cb3     let(:type) \{ \cf5 \strokec5 "Pickup(In-Store)"\cf4 \strokec4  \}\cb1 \
\cb3     let(:menu) \cf6 \strokec6 do\cf4 \cb1 \strokec4 \
\cb3       \cf6 \strokec6 if\cf4 \strokec4  menu_context == :main\cb1 \
\cb3         \cf11 \cb3 \strokec11 Dispensary\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 DesktopMain\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 Page\cf4 \cb3 \strokec4 .\cf9 \cb3 \strokec9 new\cf4 \cb1 \strokec4 \
\cb3       \cf6 \strokec6 else\cf4 \cb1 \strokec4 \
\cb3         \cf11 \cb3 \strokec11 Dispensary\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 DesktopEmbedded\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 Page\cf4 \cb3 \strokec4 .\cf9 \cb3 \strokec9 new\cf4 \cb1 \strokec4 \
\cb3       \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\cb3     \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\
\cb3     include_examples \cf5 \strokec5 "Scheduled Ordering + Order Limits for all order types"\cf4 \strokec4 , testrail_id: \cf8 \strokec8 491871\cf4 \cb1 \strokec4 \
\cb3   \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\
\cb3   context \cf5 \strokec5 "Curbside Pickup"\cf4 \strokec4  \cf6 \strokec6 do\cf4 \cb1 \strokec4 \
\cb3     let(:ordertype) \{ \cf5 \strokec5 "Curbside Pickup"\cf4 \strokec4  \}\cb1 \
\cb3     let(:fulfillment) \{ \cf5 \strokec5 "Pickup"\cf4 \strokec4  \}\cb1 \
\cb3     let(:type) \{ \cf5 \strokec5 "Pickup(Curbside)"\cf4 \strokec4  \}\cb1 \
\cb3     let(:menu) \cf6 \strokec6 do\cf4 \cb1 \strokec4 \
\cb3       \cf6 \strokec6 if\cf4 \strokec4  menu_context == :main\cb1 \
\cb3         \cf11 \cb3 \strokec11 Dispensary\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 DesktopMain\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 Page\cf4 \cb3 \strokec4 .\cf9 \cb3 \strokec9 new\cf4 \cb1 \strokec4 \
\cb3       \cf6 \strokec6 else\cf4 \cb1 \strokec4 \
\cb3         \cf11 \cb3 \strokec11 Dispensary\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 DesktopEmbedded\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 Page\cf4 \cb3 \strokec4 .\cf9 \cb3 \strokec9 new\cf4 \cb1 \strokec4 \
\cb3       \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\cb3     \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\
\cb3     include_examples \cf5 \strokec5 "Scheduled Ordering + Order Limits for all order types"\cf4 \strokec4 , testrail_id: \cf8 \strokec8 491875\cf4 \cb1 \strokec4 \
\cb3   \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\
\cb3   context \cf5 \strokec5 "Drive-Thru Pickup"\cf4 \strokec4  \cf6 \strokec6 do\cf4 \cb1 \strokec4 \
\cb3     let(:ordertype) \{ \cf5 \strokec5 "Drive-Thru Pickup"\cf4 \strokec4  \}\cb1 \
\cb3     let(:fulfillment) \{ \cf5 \strokec5 "Pickup"\cf4 \strokec4  \}\cb1 \
\cb3     let(:type) \{ \cf5 \strokec5 "Pickup(Drive thru)"\cf4 \strokec4  \}\cb1 \
\cb3     let(:menu) \cf6 \strokec6 do\cf4 \cb1 \strokec4 \
\cb3       \cf6 \strokec6 if\cf4 \strokec4  menu_context == :main\cb1 \
\cb3         \cf11 \cb3 \strokec11 Dispensary\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 DesktopMain\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 Page\cf4 \cb3 \strokec4 .\cf9 \cb3 \strokec9 new\cf4 \cb1 \strokec4 \
\cb3       \cf6 \strokec6 else\cf4 \cb1 \strokec4 \
\cb3         \cf11 \cb3 \strokec11 Dispensary\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 DesktopEmbedded\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 Page\cf4 \cb3 \strokec4 .\cf9 \cb3 \strokec9 new\cf4 \cb1 \strokec4 \
\cb3       \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\cb3     \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\
\cb3     include_examples \cf5 \strokec5 "Scheduled Ordering + Order Limits for all order types"\cf4 \strokec4 , testrail_id: \cf8 \strokec8 491876\cf4 \cb1 \strokec4 \
\cb3   \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\
\cb3   context \cf5 \strokec5 "Delivery"\cf4 \strokec4  \cf6 \strokec6 do\cf4 \cb1 \strokec4 \
\cb3     let(:ordertype) \{ \cf5 \strokec5 "Delivery"\cf4 \strokec4  \}\cb1 \
\cb3     let(:fulfillment) \{ \cf5 \strokec5 "Delivery"\cf4 \strokec4  \}\cb1 \
\cb3     let(:type) \{ \cf5 \strokec5 "Delivery"\cf4 \strokec4  \}\cb1 \
\cb3     let(:menu) \cf6 \strokec6 do\cf4 \cb1 \strokec4 \
\cb3       \cf6 \strokec6 if\cf4 \strokec4  menu_context == :main\cb1 \
\cb3         \cf11 \cb3 \strokec11 Dispensary\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 DesktopMain\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 Page\cf4 \cb3 \strokec4 .\cf9 \cb3 \strokec9 new\cf4 \cb1 \strokec4 \
\cb3       \cf6 \strokec6 else\cf4 \cb1 \strokec4 \
\cb3         \cf11 \cb3 \strokec11 Dispensary\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 DesktopEmbedded\cf4 \cb3 \strokec4 ::\cf11 \cb3 \strokec11 Page\cf4 \cb3 \strokec4 .\cf9 \cb3 \strokec9 new\cf4 \cb1 \strokec4 \
\cb3       \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\cb3     \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\
\cb3     include_examples \cf5 \strokec5 "Scheduled Ordering + Order Limits for all order types"\cf4 \strokec4 , testrail_id: \cf8 \strokec8 491872\cf4 \cb1 \strokec4 \
\cb3   \cf6 \strokec6 end\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf6 \cb3 \strokec6 end\cf4 \cb1 \strokec4 \
}