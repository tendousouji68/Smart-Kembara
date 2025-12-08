APP_NAME: Balik Kampungku
DOMAIN: balik-kampungku.com
FLOW 1:
    - ADMIN - LOGIN BY EMAIL
    - VENDOR - LOGIN BY EMAIL
        - Register Bus & Driver (1)
        - Register Slot for Event (3)
            - Add checkpoints & price for destination
    - COORDINATOR (ADMIN - LOGIN BY EMAIL)
        - Announcement Event to Vendor(2)
            - Propose Destination
        - Announcement to User(5)
        - Choose Slot & Create Trips (4)
        - Buy tickets (6)
    - USER (STUDENTS - LOGIN BY ID / PARENTS - LOGIN BY EMAIL)
        - Buy tickets (6)
            - Discount / Coupon
            - Infaq Makanan (By Bus)
FLOW 2:
    - USER
        - cancel trip
FLOW 3:
    - COORDINATOR
        - doublecheck students @checkpoint1
        - scan boarding QR
        - raise announcement
    - DRIVER
        - update every checkpoint
        - scan dropoff QR
        - manual dropoff
        - raise announcement
    - PARENTS
        - view active checkpoint
        - issue complaint
        - prompt if anak tak naik
         
SETUP:
    - ADMIN :
        - USER
        - ROLES
        - VENUE MRSM 
            - Logo
            - Markup Rate
        - COUPON
    - VENDOR : 
        - BUS
    - COORDINATOR

MODULE

REGISTRATION
- user/parents
- vendor/driver
- admin/coordinator