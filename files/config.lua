return {
    key_attribute_name = "${SAML_USERNAME_ATTRIBUTE_NAME}",
    redirect = {
        url_after_login = "/",
        url_after_logout = "/"
    },
    request = {
        idp_dest_url = "${SAML_IDP_LOGIN_URL}",
        sp_entity_id = "${SAML_SP_ENTRY_ID}",
        sp_saml_finish_url = "${SAML_SP_ACS_URL}",
        urls_before_login = {
            dict_name = "sso_redirect_urls",
            expire_seconds = 180
	    }
    },
    response = {
        xmlsec_command = "/usr/bin/xmlsec1",
        idp_cert_filename = "${SAML_IDP_CERTIFICATE_FILE}"
    },
    session = {
        cookie = {
            name = "sso_session_id",
            path = "/",
            secure = true
        },
        store = {
            dict_name = "sso_sessions",
            expire_seconds = 600
        }
    }
}
