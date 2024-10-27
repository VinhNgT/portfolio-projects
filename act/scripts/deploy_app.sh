act --directory ../ \
    --action-cache-path action_cache \
    --artifact-server-path artifact_cache \
    --cache-server-path cache \
    --secret-file act/act.secrets \
    --var-file act/act.var \
    --eventpath act/act.event.json \
    --no-skip-checkout \
    --workflows .github/workflows/deploy_app.yml

# act --directory ../ \
#     --action-cache-path action_cache \
#     --artifact-server-path artifact_cache \
#     --cache-server-path cache \
#     --secret-file act/act.secrets \
#     --var-file act/act.var \
#     --eventpath act/act.event.json \
#     --no-skip-checkout \
#     --workflows .github/workflows/deploy_app.yml \
#     --job test-telegram
