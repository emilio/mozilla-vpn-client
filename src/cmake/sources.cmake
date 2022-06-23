# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Generated version header file
configure_file(version.h.in ${CMAKE_CURRENT_BINARY_DIR}/version.h)
target_sources(mozillavpn PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/version.h)

# VPN Client source files
target_sources(mozillavpn PRIVATE
    addonmanager.cpp
    addonmanager.h
    addons/addon.cpp
    addons/addon.h
    addons/addondemo.cpp
    addons/addondemo.h
    addons/addonguide.cpp
    addons/addonguide.h
    addons/addoni18n.cpp
    addons/addoni18n.h
    addons/addontutorial.cpp
    addons/addontutorial.h
    appimageprovider.h
    applistprovider.h
    apppermission.cpp
    apppermission.h
    authenticationlistener.cpp
    authenticationlistener.h
    authenticationinapp/authenticationinapp.cpp
    authenticationinapp/authenticationinapp.h
    authenticationinapp/authenticationinapplistener.cpp
    authenticationinapp/authenticationinapplistener.h
    authenticationinapp/authenticationinappsession.cpp
    authenticationinapp/authenticationinappsession.h
    authenticationinapp/incrementaldecoder.cpp
    authenticationinapp/incrementaldecoder.h
    captiveportal/captiveportal.cpp
    captiveportal/captiveportal.h
    captiveportal/captiveportaldetection.cpp
    captiveportal/captiveportaldetection.h
    captiveportal/captiveportaldetectionimpl.cpp
    captiveportal/captiveportaldetectionimpl.h
    captiveportal/captiveportalmonitor.cpp
    captiveportal/captiveportalmonitor.h
    captiveportal/captiveportalnotifier.cpp
    captiveportal/captiveportalnotifier.h
    captiveportal/captiveportalrequest.cpp
    captiveportal/captiveportalrequest.h
    captiveportal/captiveportalrequesttask.cpp
    captiveportal/captiveportalrequesttask.h
    closeeventhandler.cpp
    closeeventhandler.h
    collator.cpp
    collator.h
    command.cpp
    command.h
    commandlineparser.cpp
    commandlineparser.h
    commands/commandactivate.cpp
    commands/commandactivate.h
    commands/commanddeactivate.cpp
    commands/commanddeactivate.h
    commands/commanddevice.cpp
    commands/commanddevice.h
    commands/commandlogin.cpp
    commands/commandlogin.h
    commands/commandlogout.cpp
    commands/commandlogout.h
    commands/commandselect.cpp
    commands/commandselect.h
    commands/commandservers.cpp
    commands/commandservers.h
    commands/commandstatus.cpp
    commands/commandstatus.h
    commands/commandui.cpp
    commands/commandui.h
    composerblock.cpp
    composerblock.h
    composer.cpp
    composer.h
    connectionbenchmark/benchmarktask.cpp
    connectionbenchmark/benchmarktask.h
    connectionbenchmark/benchmarktaskdownload.cpp
    connectionbenchmark/benchmarktaskdownload.h
    connectionbenchmark/benchmarktaskping.cpp
    connectionbenchmark/benchmarktaskping.h
    connectionbenchmark/benchmarktasksentinel.h
    connectionbenchmark/connectionbenchmark.cpp
    connectionbenchmark/connectionbenchmark.h
    connectionhealth.cpp
    connectionhealth.h
    constants.cpp
    constants.h
    controller.cpp
    controller.h
    controllerimpl.h
    cryptosettings.cpp
    cryptosettings.h
    curve25519.cpp
    curve25519.h
    dnshelper.cpp
    dnshelper.h
    dnspingsender.cpp
    dnspingsender.h
    errorhandler.cpp
    errorhandler.h
    filterproxymodel.cpp
    filterproxymodel.h
    fontloader.cpp
    fontloader.h
    hacl-star/Hacl_Chacha20.c
    hacl-star/Hacl_Chacha20Poly1305_32.c
    hacl-star/Hacl_Curve25519_51.c
    hacl-star/Hacl_Poly1305_32.c
    hawkauth.cpp
    hawkauth.h
    hkdf.cpp
    hkdf.h
    iaphandler.cpp
    iaphandler.h
    imageproviderfactory.cpp
    imageproviderfactory.h
    inspector/inspectorhandler.cpp
    inspector/inspectorhandler.h
    inspector/inspectoritempicker.cpp
    inspector/inspectoritempicker.h
    inspector/inspectorutils.cpp
    inspector/inspectorutils.h
    inspector/inspectorwebsocketconnection.cpp
    inspector/inspectorwebsocketconnection.h
    inspector/inspectorwebsocketserver.cpp
    inspector/inspectorwebsocketserver.h
    ipaddress.cpp
    ipaddress.h
    ipaddresslookup.cpp
    ipaddresslookup.h
    itempicker.cpp
    itempicker.h
    leakdetector.cpp
    leakdetector.h
    localizer.cpp
    localizer.h
    logger.cpp
    logger.h
    loghandler.cpp
    loghandler.h
    logoutobserver.cpp
    logoutobserver.h
    main.cpp
    models/device.cpp
    models/device.h
    models/devicemodel.cpp
    models/devicemodel.h
    models/feature.cpp
    models/feature.h
    models/featuremodel.cpp
    models/featuremodel.h
    models/feedbackcategorymodel.cpp
    models/feedbackcategorymodel.h
    models/helpmodel.cpp
    models/helpmodel.h
    models/keys.cpp
    models/keys.h
    models/licensemodel.cpp
    models/licensemodel.h
    models/server.cpp
    models/server.h
    models/servercity.cpp
    models/servercity.h
    models/servercountry.cpp
    models/servercountry.h
    models/servercountrymodel.cpp
    models/servercountrymodel.h
    models/serverdata.cpp
    models/serverdata.h
    models/supportcategorymodel.cpp
    models/supportcategorymodel.h
    models/survey.cpp
    models/survey.h
    models/surveymodel.cpp
    models/surveymodel.h
    models/user.cpp
    models/user.h
    models/whatsnewmodel.cpp
    models/whatsnewmodel.h
    mozillavpn.cpp
    mozillavpn.h
    networkmanager.cpp
    networkmanager.h
    networkrequest.cpp
    networkrequest.h
    networkwatcher.cpp
    networkwatcher.h
    networkwatcherimpl.h
    notificationhandler.cpp
    notificationhandler.h
    pinghelper.cpp
    pinghelper.h
    pingsender.cpp
    pingsender.h
    pingsenderfactory.cpp
    pingsenderfactory.h
    platforms/dummy/dummyapplistprovider.cpp
    platforms/dummy/dummyapplistprovider.h
    platforms/dummy/dummyiaphandler.cpp
    platforms/dummy/dummyiaphandler.h
    platforms/dummy/dummynetworkwatcher.cpp
    platforms/dummy/dummynetworkwatcher.h
    platforms/dummy/dummypingsender.cpp
    platforms/dummy/dummypingsender.h
    profileflow.h
    profileflow.cpp
    qmlengineholder.cpp
    qmlengineholder.h
    releasemonitor.cpp
    releasemonitor.h
    rfc/rfc1112.cpp
    rfc/rfc1112.h
    rfc/rfc1918.cpp
    rfc/rfc1918.h
    rfc/rfc4193.cpp
    rfc/rfc4193.h
    rfc/rfc4291.cpp
    rfc/rfc4291.h
    rfc/rfc5735.cpp
    rfc/rfc5735.h
    serveri18n.cpp
    serveri18n.h
    settingsholder.cpp
    settingsholder.h
    signature.h
    signature.cpp
    simplenetworkmanager.cpp
    simplenetworkmanager.h
    statusicon.cpp
    statusicon.h
    subscriptiondata.cpp
    subscriptiondata.h
    task.h
    taskscheduler.cpp
    taskscheduler.h
    tasks/account/taskaccount.cpp
    tasks/account/taskaccount.h
    tasks/adddevice/taskadddevice.cpp
    tasks/adddevice/taskadddevice.h
    tasks/addon/taskaddon.cpp
    tasks/addon/taskaddon.h
    tasks/addonindex/taskaddonindex.cpp
    tasks/addonindex/taskaddonindex.h
    tasks/authenticate/taskauthenticate.cpp
    tasks/authenticate/taskauthenticate.h
    tasks/captiveportallookup/taskcaptiveportallookup.cpp
    tasks/captiveportallookup/taskcaptiveportallookup.h
    tasks/deleteaccount/taskdeleteaccount.cpp
    tasks/deleteaccount/taskdeleteaccount.h
    tasks/getfeaturelist/taskgetfeaturelist.cpp
    tasks/getfeaturelist/taskgetfeaturelist.h
    tasks/getsubscriptiondetails/taskgetsubscriptiondetails.cpp
    tasks/getsubscriptiondetails/taskgetsubscriptiondetails.h
    tasks/controlleraction/taskcontrolleraction.cpp
    tasks/controlleraction/taskcontrolleraction.h
    tasks/createsupportticket/taskcreatesupportticket.cpp
    tasks/createsupportticket/taskcreatesupportticket.h
    tasks/function/taskfunction.cpp
    tasks/function/taskfunction.h
    tasks/group/taskgroup.cpp
    tasks/group/taskgroup.h
    tasks/heartbeat/taskheartbeat.cpp
    tasks/heartbeat/taskheartbeat.h
    tasks/ipfinder/taskipfinder.cpp
    tasks/ipfinder/taskipfinder.h
    tasks/products/taskproducts.cpp
    tasks/products/taskproducts.h
    tasks/release/taskrelease.cpp
    tasks/release/taskrelease.h
    tasks/removedevice/taskremovedevice.cpp
    tasks/removedevice/taskremovedevice.h
    tasks/sendfeedback/tasksendfeedback.cpp
    tasks/sendfeedback/tasksendfeedback.h
    tasks/servers/taskservers.cpp
    tasks/servers/taskservers.h
    tasks/surveydata/tasksurveydata.cpp
    tasks/surveydata/tasksurveydata.h
    telemetry.cpp
    telemetry.h
    theme.cpp
    theme.h
    timersingleshot.cpp
    timersingleshot.h
    tutorial/tutorialstep.cpp
    tutorial/tutorialstep.h
    tutorial/tutorialstepbefore.cpp
    tutorial/tutorialstepbefore.h
    tutorial/tutorialstepnext.cpp
    tutorial/tutorialstepnext.h
    tutorial/tutorial.cpp
    tutorial/tutorial.h
    update/updater.cpp
    update/updater.h
    update/versionapi.cpp
    update/versionapi.h
    update/webupdater.cpp
    update/webupdater.h
    urlopener.cpp
    urlopener.h
    websockethandler.cpp
    websockethandler.h
)

# VPN Client UI resources
target_sources(mozillavpn PRIVATE
    ui/license.qrc
    ui/resources.qrc
    ui/ui.qrc
    resources/certs/certs.qrc
    resources/public_keys/public_keys.qrc
)

# Signal handling for unix platforms
if(UNIX)
    target_sources(mozillavpn PRIVATE
        signalhandler.cpp
        signalhandler.h
    )
endif()

# Sources for desktop platforms.
if(NOT CMAKE_CROSSCOMPILING)
    target_sources(mozillavpn PRIVATE
        systemtraynotificationhandler.cpp
        systemtraynotificationhandler.h
        tasks/authenticate/desktopauthenticationlistener.cpp
        tasks/authenticate/desktopauthenticationlistener.h
    )
endif()

qt6_add_qml_module(mozillavpn
  URI Mozilla.VPN.qmlcomponents
  VERSION 1.0
)
