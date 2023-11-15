{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red89\green138\blue67;\red23\green23\blue23;\red202\green202\blue202;
\red70\green137\blue204;\red194\green126\blue101;\red183\green111\blue179;\red140\green211\blue254;\red67\green192\blue160;
\red167\green197\blue152;}
{\*\expandedcolortbl;;\cssrgb\c41569\c60000\c33333;\cssrgb\c11765\c11765\c11765;\cssrgb\c83137\c83137\c83137;
\cssrgb\c33725\c61176\c83922;\cssrgb\c80784\c56863\c47059;\cssrgb\c77255\c52549\c75294;\cssrgb\c61176\c86275\c99608;\cssrgb\c30588\c78824\c69020;
\cssrgb\c70980\c80784\c65882;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 # frozen_string_literal: true\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 require_relative\cf4 \cb3 \strokec4  \cf6 \strokec6 \'93scheduled_ordering_e2e_shared_examples"\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 feature \cf6 \strokec6 "Scheduled Ordering Limits e2e flow"\cf4 \strokec4 , :desktop_only, :main_and_embedded, :focus, :headed \cf7 \strokec7 do\cf4 \cb1 \strokec4 \
\cb3   let(:enabled)      \{ \{enabled: \cf5 \cb3 \strokec5 true\cf4 \cb3 \strokec4 , paymentTypes: \{cash: \cf5 \cb3 \strokec5 true\cf4 \cb3 \strokec4 \}\} \}\cb1 \
\cb3   let(:menu_context) \{ |\cf8 \cb3 \strokec8 example\cf4 \cb3 \strokec4 | example.metadata[:menu_context] \}\cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 #  let(:admin)        \{ create(:user, :dispensary_admin, profile_attributes: \{dispensaryId: dispensary._id\}) \}\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3   let(:settings)     \{ \cf9 \cb3 \strokec9 AdminSettings\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 Page\cf4 \cb3 \strokec4 .\cf5 \cb3 \strokec5 new\cf4 \cb3 \strokec4  \}\cb1 \
\cb3   let(:orders)       \{ \cf9 \cb3 \strokec9 AdminDispensaryOrders\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 Page\cf4 \cb3 \strokec4 .\cf5 \cb3 \strokec5 new\cf4 \cb3 \strokec4  \}\cb1 \
\cb3   let(:checkout)     \{ \cf9 \cb3 \strokec9 Checkout\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 Page\cf4 \cb3 \strokec4 .\cf5 \cb3 \strokec5 new\cf4 \cb3 \strokec4  \}\cb1 \
\cb3   let!(:dispensary) \cf7 \strokec7 do\cf4 \cb1 \strokec4 \
\cb3     create(\cb1 \
\cb3       :dispensary_with_products,\cb1 \
\cb3       profile_attributes: \{\cb1 \
\cb3         featureFlags:       \{enableArrivals: \cf5 \cb3 \strokec5 true\cf4 \cb3 \strokec4 \},\cb1 \
\cb3         order_types_config: \{\cb1 \
\cb3           pickup:          enabled,\cb1 \
\cb3           curbsidePickup:  enabled,\cb1 \
\cb3           driveThruPickup: enabled,\cb1 \
\cb3           delivery:        enabled,\cb1 \
\cb3           kiosk:           enabled\cb1 \
\cb3         \}\cb1 \
\cb3       \}\cb1 \
\cb3     )\cb1 \
\cb3   \cf7 \strokec7 end\cf4 \cb1 \strokec4 \
\
\cb3   context \cf6 \strokec6 "Admin"\cf4 \strokec4  \cf7 \strokec7 do\cf4 \cb1 \strokec4 \
\cb3     let(:admin) \cf7 \strokec7 do\cf4 \cb1 \strokec4 \
\cb3       create(:user, :dispensary_admin, profile_attributes: \{dispensaryId: dispensary._id\})\cb1 \
\cb3     \cf7 \strokec7 end\cf4 \cb1 \strokec4 \
\
\cb3     context \cf6 \strokec6 "In Store Pickup"\cf4 \strokec4  \cf7 \strokec7 do\cf4 \cb1 \strokec4 \
\cb3       let(:ordertype) \{ \cf6 \strokec6 "In-Store Pickup"\cf4 \strokec4  \}\cb1 \
\cb3       let(:fulfillment) \{ \cf6 \strokec6 "Pickup"\cf4 \strokec4  \}\cb1 \
\cb3       let(:type) \{ \cf6 \strokec6 "Pickup(In-Store)"\cf4 \strokec4  \}\cb1 \
\cb3       let(:menu) \cf7 \strokec7 do\cf4 \cb1 \strokec4 \
\cb3         \cf7 \strokec7 if\cf4 \strokec4  menu_context == :main\cb1 \
\cb3           \cf9 \cb3 \strokec9 Dispensary\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 DesktopMain\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 Page\cf4 \cb3 \strokec4 .\cf5 \cb3 \strokec5 new\cf4 \cb1 \strokec4 \
\cb3         \cf7 \strokec7 else\cf4 \cb1 \strokec4 \
\cb3           \cf9 \cb3 \strokec9 Dispensary\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 DesktopEmbedded\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 Page\cf4 \cb3 \strokec4 .\cf5 \cb3 \strokec5 new\cf4 \cb1 \strokec4 \
\cb3         \cf7 \strokec7 end\cf4 \cb1 \strokec4 \
\cb3       \cf7 \strokec7 end\cf4 \cb1 \strokec4 \
\cb3   \cb1 \
\cb3       include_examples \cf6 \strokec6 "Scheduled Ordering + Order Limits for pickup order types"\cf4 \strokec4 , testrail_id: \cf10 \strokec10 491871\cf4 \cb1 \strokec4 \
\cb3     \cf7 \strokec7 end\cf4 \cb1 \strokec4 \
\
\cb3     context \cf6 \strokec6 "Curbside Pickup"\cf4 \strokec4  \cf7 \strokec7 do\cf4 \cb1 \strokec4 \
\cb3       let(:ordertype) \{ \cf6 \strokec6 "Curbside Pickup"\cf4 \strokec4  \}\cb1 \
\cb3       let(:fulfillment) \{ \cf6 \strokec6 "Pickup"\cf4 \strokec4  \}\cb1 \
\cb3       let(:type) \{ \cf6 \strokec6 "Pickup(Curbside)"\cf4 \strokec4  \}\cb1 \
\cb3       let(:menu) \cf7 \strokec7 do\cf4 \cb1 \strokec4 \
\cb3         \cf7 \strokec7 if\cf4 \strokec4  menu_context == :main\cb1 \
\cb3           \cf9 \cb3 \strokec9 Dispensary\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 DesktopMain\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 Page\cf4 \cb3 \strokec4 .\cf5 \cb3 \strokec5 new\cf4 \cb1 \strokec4 \
\cb3         \cf7 \strokec7 else\cf4 \cb1 \strokec4 \
\cb3           \cf9 \cb3 \strokec9 Dispensary\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 DesktopEmbedded\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 Page\cf4 \cb3 \strokec4 .\cf5 \cb3 \strokec5 new\cf4 \cb1 \strokec4 \
\cb3         \cf7 \strokec7 end\cf4 \cb1 \strokec4 \
\cb3       \cf7 \strokec7 end\cf4 \cb1 \strokec4 \
\cb3   \cb1 \
\cb3       include_examples \cf6 \strokec6 "Scheduled Ordering + Order Limits for pickup order types"\cf4 \strokec4 , testrail_id: \cf10 \strokec10 491875\cf4 \cb1 \strokec4 \
\cb3     \cf7 \strokec7 end\cf4 \cb1 \strokec4 \
\cb3   \cb1 \
\cb3     context \cf6 \strokec6 "Drive-Thru Pickup"\cf4 \strokec4  \cf7 \strokec7 do\cf4 \cb1 \strokec4 \
\cb3       let(:ordertype) \{ \cf6 \strokec6 "Drive-Thru Pickup"\cf4 \strokec4  \}\cb1 \
\cb3       let(:fulfillment) \{ \cf6 \strokec6 "Pickup"\cf4 \strokec4  \}\cb1 \
\cb3       let(:type) \{ \cf6 \strokec6 "Pickup(Drive thru)"\cf4 \strokec4  \}\cb1 \
\cb3       let(:menu) \cf7 \strokec7 do\cf4 \cb1 \strokec4 \
\cb3         \cf7 \strokec7 if\cf4 \strokec4  menu_context == :main\cb1 \
\cb3           \cf9 \cb3 \strokec9 Dispensary\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 DesktopMain\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 Page\cf4 \cb3 \strokec4 .\cf5 \cb3 \strokec5 new\cf4 \cb1 \strokec4 \
\cb3         \cf7 \strokec7 else\cf4 \cb1 \strokec4 \
\cb3           \cf9 \cb3 \strokec9 Dispensary\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 DesktopEmbedded\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 Page\cf4 \cb3 \strokec4 .\cf5 \cb3 \strokec5 new\cf4 \cb1 \strokec4 \
\cb3         \cf7 \strokec7 end\cf4 \cb1 \strokec4 \
\cb3       \cf7 \strokec7 end\cf4 \cb1 \strokec4 \
\cb3   \cb1 \
\cb3       include_examples \cf6 \strokec6 "Scheduled Ordering + Order Limits for pickup order types"\cf4 \strokec4 , testrail_id: \cf10 \strokec10 491876\cf4 \cb1 \strokec4 \
\cb3     \cf7 \strokec7 end\cf4 \cb1 \strokec4 \
\cb3   \cb1 \
\cb3     context \cf6 \strokec6 "Delivery"\cf4 \strokec4  \cf7 \strokec7 do\cf4 \cb1 \strokec4 \
\cb3       let(:ordertype) \{ \cf6 \strokec6 "Delivery"\cf4 \strokec4  \}\cb1 \
\cb3       let(:fulfillment) \{ \cf6 \strokec6 "Delivery"\cf4 \strokec4  \}\cb1 \
\cb3       let(:type) \{ \cf6 \strokec6 "Delivery"\cf4 \strokec4  \}\cb1 \
\cb3       let(:menu) \cf7 \strokec7 do\cf4 \cb1 \strokec4 \
\cb3         \cf7 \strokec7 if\cf4 \strokec4  menu_context == :main\cb1 \
\cb3           \cf9 \cb3 \strokec9 Dispensary\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 DesktopMain\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 Page\cf4 \cb3 \strokec4 .\cf5 \cb3 \strokec5 new\cf4 \cb1 \strokec4 \
\cb3         \cf7 \strokec7 else\cf4 \cb1 \strokec4 \
\cb3           \cf9 \cb3 \strokec9 Dispensary\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 DesktopEmbedded\cf4 \cb3 \strokec4 ::\cf9 \cb3 \strokec9 Page\cf4 \cb3 \strokec4 .\cf5 \cb3 \strokec5 new\cf4 \cb1 \strokec4 \
\cb3         \cf7 \strokec7 end\cf4 \cb1 \strokec4 \
\cb3       \cf7 \strokec7 end\cf4 \cb1 \strokec4 \
\cb3   \cb1 \
\cb3       include_examples \cf6 \strokec6 "Scheduled Ordering + Order Limits for delivery order types"\cf4 \strokec4 , testrail_id: \cf10 \strokec10 491872\cf4 \cb1 \strokec4 \
\cb3     \cf7 \strokec7 end\cf4 \cb1 \strokec4 \
\cb3   \cf7 \strokec7 end\cf4 \cb1 \strokec4 \
}