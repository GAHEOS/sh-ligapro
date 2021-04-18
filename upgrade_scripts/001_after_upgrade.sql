ALTER TABLE res_partner
    RENAME COLUMN city_id TO x_city_id;

-- Install l10n_latam_tax
-- Update l10n_ec_base

ALTER TABLE res_country_state_city ALTER COLUMN state_id DROP NOT NULL;
UPDATE res_country_state SET code = 'v11_'||code WHERE country_id=63;

DELETE FROM ir_model_data WHERE model='res.country.state' AND module='l10n_ec_base';


DELETE
FROM ir_ui_view
WHERE id IN (SELECT res_id
             FROM ir_model_data
             WHERE model = 'ir.ui.view'
               AND module IN ('l10n_ec_base', 'l10n_ec_account', 'l10n_ec_bank', 'l10n_ec_sale', 'l10n_ec_purchase'));
