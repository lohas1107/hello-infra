WORKSPACE_SCRIPT = workspace/docker-compose.yml

workspace: exit
	docker-compose -f $(WORKSPACE_SCRIPT) up -d workspace
	docker-compose -f $(WORKSPACE_SCRIPT) exec -w /workspace/$(filter-out $@,$(MAKECMDGOALS)) workspace bash

exit:
	docker rmi -f workspace
	docker-compose -f $(WORKSPACE_SCRIPT) down --remove-orphans --volumes

.PHONY: workspace