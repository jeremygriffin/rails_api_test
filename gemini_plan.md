# Gemini Plan for Rails API Extension

**Goal:** Implement the API endpoints for containers as described in `ASSESSMENT.md` and write comprehensive RSpec tests for all new functionality.

---

**Phase 1: Setup and Preparation**

1.  **Verify RSpec Installation:** I will check the `Gemfile` to see if `rspec-rails` is already included. If it's not, I will add it to the `Gemfile` and then run `bundle install` to install the new dependency.
    *   *Reasoning:* RSpec is required for writing the tests you requested.
    *   *Tools:* `read_file` (for `Gemfile`), `replace` (to add `rspec-rails` to `Gemfile`), `run_shell_command` (for `bundle install`).
2.  **Initialize RSpec (if necessary):** After ensuring `rspec-rails` is in the `Gemfile` and installed, I will check for the presence of `spec/spec_helper.rb` and `spec/rails_helper.rb`. If these files are missing, it indicates RSpec has not been initialized, and I will run `rails generate rspec:install` to set up the basic RSpec directory.
    *   *Reasoning:* This command sets up the necessary files for RSpec to function correctly within a Rails application.
    *   *Tools:* `glob` (to check for RSpec helper files), `run_shell_command` (for `rails generate rspec:install`).

**Phase 2: Implement Container API Endpoints**

1.  **Create `ContainersController`:** I will create a new controller file, `app/controllers/containers_controller.rb`. This controller will house the logic for the new container-related API endpoints.
    *   *Reasoning:* This adheres to Rails' convention of separating concerns, keeping container-specific logic distinct from item-specific logic.
    *   *Tools:* `write_file`.
2.  **Define New Routes in `config/routes.rb`:** I will modify the `config/routes.rb` file to add the new routes for `/containers/:id` and `/containers/:id/items`, mapping them to appropriate actions within the `ContainersController`.
    *   *Reasoning:* This makes the new API endpoints accessible to clients.
    *   *Tools:* `replace`.
3.  **Implement `show` action in `ContainersController`:** Within the `ContainersController`, I will implement the `show` action. This action will be responsible for finding all `Item` records associated with a given `container` ID and calculating the sum of their `weight` attributes.
    *   *Reasoning:* This fulfills the requirement for the `/containers/:id` endpoint.
    *   *Tools:* (Logic will be part of the `write_file` for `ContainersController` in step 1 of this phase).
4.  **Implement `items` action in `ContainersController`:** Also within the `ContainersController`, I will implement the `items` action. This action will retrieve all `Item` records that belong to a specified `container` ID.
    *   *Reasoning:* This fulfills the requirement for the `/containers/:id/items` endpoint.
    *   *Tools:* (Logic will be part of the `write_file` for `ContainersController` in step 1 of this phase).

**Phase 3: Write RSpec Tests**

1.  **Create `containers_controller_spec.rb`:** I will create a new RSpec request spec file at `spec/requests/containers_controller_spec.rb`. This file will contain tests for both the `show` and `items` actions of the `ContainersController`. The tests will:
    *   Verify that the `/containers/:id` endpoint correctly returns the container ID and the calculated total weight.
    *   Verify that the `/containers/:id/items` endpoint correctly returns all items associated with the given container ID.
    *   These tests will involve setting up test data (e.g., using factories or direct `Item.create` calls) to simulate various scenarios.
    *   *Reasoning:* To ensure the new API endpoints function correctly and meet the specified requirements, as well as to prevent future regressions.
    *   *Tools:* `write_file`.
2.  **Create `item_spec.rb` (if necessary):** I will check if a model spec already exists for `Item` at `spec/models/item_spec.rb`. If not, I will create a basic one to ensure the `Item` model's attributes are correctly defined and accessible.
    *   *Reasoning:* To ensure the core `Item` model, which the new features rely on, is functioning as expected.
    *   *Tools:* `glob` (to check for existing spec), `write_file`.

**Phase 4: Verification**

1.  **Run RSpec Tests:** After implementing the code and tests, I will execute all RSpec tests to confirm that the new features work as intended and that no existing functionality has been broken.
    *   *Reasoning:* Essential for verifying correctness and stability.
    *   *Tools:* `run_shell_command` (for `bundle exec rspec`).
2.  **Run Rubocop:** I will run Rubocop to ensure that all newly added or modified code adheres to the project's established Ruby style guidelines.
    *   *Reasoning:* To maintain code quality and consistency.
    *   *Tools:* `run_shell_command` (for `bundle exec rubocop`).

---

**Commit Strategy:**

*   **Granular Commits:** I will make commits for each groupable change.
*   **Conventional Commits:** Each commit message will follow the Conventional Commits specification.
*   **Model Tag:** Each commit message will include the tag `AI: gemini-2.5-flash` at the bottom.

---

**Phase 5: Implement Item Status Tracking**

1.  **Create `ItemStatus` Model and Migration:** Generate a new model `ItemStatus` with `status` (string), `timestamp` (datetime), and `item:references`. Run the migration to create the `item_statuses` table.
    *   *Reasoning:* To track item statuses over time as per `ASSESSMENT.md`.
    *   *Tools:* `run_shell_command` (for `rails generate model ItemStatus`), `run_shell_command` (for `rails db:migrate`).
2.  **Update `Item` Model:** Add `has_many :item_statuses` association to `app/models/item.rb`.
    *   *Reasoning:* To establish the relationship between `Item` and `ItemStatus`.
    *   *Tools:* `replace`.
3.  **Update `ItemStatus` Model:** Add `belongs_to :item` association and `validates :status, presence: true`, `validates :timestamp, presence: true` to `app/models/item_status.rb`.
    *   *Reasoning:* To establish the relationship and ensure data integrity.
    *   *Tools:* `replace`.
4.  **Modify `ContainersController#items`:** Update the `items` action in `app/controllers/containers_controller.rb` to include the latest status for each item.
    *   *Reasoning:* To fulfill the requirement of returning items with their status.
    *   *Tools:* `replace`.
5.  **Write RSpec Tests for Status Tracking:**
    *   **`ItemStatus` Spec:** Add tests for `ItemStatus` model (associations and validations).
    *   **`Item` Spec:** Add `should have_many(:item_statuses)` test to `item_spec.rb`.
    *   **`ContainersController` Spec:** Add tests to `containers_controller_spec.rb` to verify the `items` endpoint returns `current_status`.
    *   *Reasoning:* To ensure the new status tracking functionality works as expected.
    *   *Tools:* `write_file`, `replace`.
6.  **Configure `shoulda-matchers`:** Add `shoulda-matchers` gem to `Gemfile` and configure it in `spec/rails_helper.rb`.
    *   *Reasoning:* To enable concise RSpec tests for associations and validations.
    *   *Tools:* `replace`, `run_shell_command` (for `bundle install`).

---

**Phase 6: Implement Container Tracking over Time**

1.  **Create `Container` Model:** Create a new `Container` model with a `name` attribute. This will require a migration.
    *   *Reasoning:* To have a dedicated entity for containers and their historical data.
    *   *Tools:* `run_shell_command` (for `rails generate model Container`).
2.  **Update `Item` Model:** Modify the `container` attribute in `Item` to be a `references` to the new `Container` model. This will require a migration.
    *   *Reasoning:* To establish a proper association between `Item` and `Container`.
    *   *Tools:* `run_shell_command` (for `rails generate migration`).
3.  **Create `ContainerHistory` Model:** Create a new `ContainerHistory` model with `name` (string), `timestamp` (datetime), and `container:references`. This will require a migration.
    *   *Reasoning:* To track historical changes to container attributes.
    *   *Tools:* `run_shell_command` (for `rails generate model ContainerHistory`).
4.  **Update `Container` Model:** Add `has_many :container_histories` association to `app/models/container.rb`.
    *   *Reasoning:* To establish the relationship between `Container` and `ContainerHistory`.
    *   *Tools:* `replace`.
5.  **Update `ContainerHistory` Model:** Add `belongs_to :container` association and validations to `app/models/container_history.rb`.
    *   *Reasoning:* To establish the relationship and ensure data integrity.
    *   *Tools:* `replace`.
6.  **Update `ContainersController`:**
    *   Modify `show` action to use the `Container` model and return container details, including its current name.
    *   Modify `items` action to use the `Container` model.
    *   *Reasoning:* To adapt the controller to the new `Container` model.
    *   *Tools:* `replace`.
7.  **Write RSpec Tests for Container Tracking:**
    *   **`Container` Spec:** Add tests for `Container` model.
    *   **`ContainerHistory` Spec:** Add tests for `ContainerHistory` model.
    *   **`ContainersController` Spec:** Update tests to reflect changes in `ContainersController`.
    *   *Reasoning:* To ensure the new container tracking functionality works as expected.
    *   *Tools:* `write_file`, `replace`.

---

**Downloads/Runs Required to Achieve This Goal:**

*   `bundle install`: This command will be run if `rspec-rails` needs to be added to your `Gemfile`.
*   `rails generate rspec:install`: This command will be run if RSpec has not been previously initialized in your project.
