.PHONY: install
install:
	composer install

.PHONY: phpcs
phpcs:
	./vendor/bin/phpcs --standard=./vendor/spryker/code-sniffer/Spryker/ruleset.xml ./src/FondOfSpryker/* ./tests/*

.PHONY: phpcbf
phpcbf:
	./vendor/bin/phpcbf --standard=./vendor/spryker/code-sniffer/Spryker/ruleset.xml ./src/FondOfSpryker/* ./tests/*

.PHONY: phpstan
phpstan:
	./vendor/bin/phpstan --memory-limit=-1 analyse ./src/FondOfSpryker ./tests

.PHONY: codeception
codeception:
	./vendor/bin/codecept run --env standalone --coverage --coverage-xml --coverage-html

.PHONY: ci
ci: phpcs codeception phpstan

.PHONY: clean
clean:
	rm -Rf composer.lock
	rm -Rf ./vendor
	find ./tests/_output/ -not -name .gitignore -not -name .gitkeep -delete
	rm -Rf src/Generated/*
	rm -Rf src/Orm/*
