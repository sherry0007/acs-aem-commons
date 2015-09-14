<%-- Paths --%>
<section class="coral-Form-fieldset acsCommons-Form-multifieldset">
    <h3 class="coral-Form-fieldset-legend">Paths</h3>

    <div ng-repeat="item in form.checksum.paths track by $index">
        <button class="coral-Button coral-Button--square coral-Button--quiet acsCommons-Form-multifieldset-remove"
                ng-click="form.checksum.paths.splice($index, 1)">
            <i class="coral-Icon coral-Icon--delete"></i>
        </button>

        <input class="coral-Form-field coral-Textfield acsCommons-Form-multifieldset-input"
               ng-model="item.value"
               type="text"
               placeholder="Absolute path to compare">
    </div>

    <a  class="acsCommons-Form-multifieldset-add coral-Icon coral-Icon--addCircle"
        ng-click="form.checksum.paths.push({ value: '' });">Add Path</a>
</section>

<%-- Query --%>
<section class="coral-Form-fieldset">
    <h3 class="coral-Form-fieldset-legend">Query</h3>

    <select ng-options="language for language in ['None', 'xpath', 'JCR-SQL', 'JCR-SQL2']"
            ng-model="form.checksum.queryType"></select>

    <p>
                <textarea ng-hide="form.checksum.queryType === 'None'"
                          class="coral-Textfield coral-Textfield--multiline"
                          rows="4"
                          style="width: 100%"
                          ng-model="form.checksum.query"
                          type="text"></textarea>
    </p>
</section>


<%-- Exclude Properties --%>
<section class="coral-Form-fieldset acsCommons-Form-multifieldset">
    <h3 class="coral-Form-fieldset-legend">Node types</h3>

    <div ng-repeat="item in form.checksum.nodeTypes track by $index">
        <button class="coral-Button coral-Button--square coral-Button--quiet acsCommons-Form-multifieldset-remove"
                ng-click="form.checksum.nodeTypes.splice($index, 1)">
            <i class="coral-Icon coral-Icon--delete"></i>
        </button>

        <input class="coral-Form-field coral-Textfield acsCommons-Form-multifieldset-input"
               ng-model="item.value"
               type="text"
               placeholder="Node type to calculate checksum">
    </div>

    <a      class="acsCommons-Form-multifieldset-add coral-Icon coral-Icon--addCircle"
            ng-click="form.checksum.nodeTypes.push({ value: '' });">Add Node Type</a>
</section>


<%-- Exclude Properties --%>
<section class="coral-Form-fieldset acsCommons-Form-multifieldset">
    <h3 class="coral-Form-fieldset-legend">Node types to exclude</h3>

    <div ng-repeat="item in form.checksum.excludeNodeTypes track by $index">
        <button class="coral-Button coral-Button--square coral-Button--quiet acsCommons-Form-multifieldset-remove"
                ng-click="form.checksum.excludeNodeTypes.splice($index, 1)">
            <i class="coral-Icon coral-Icon--delete"></i>
        </button>

        <input class="coral-Form-field coral-Textfield acsCommons-Form-multifieldset-input"
               ng-model="item.value"
               type="text"
               placeholder="Node type to exclude"/>
    </div>


    <button class="coral-Button coral-Button--square coral-Button--quiet acsCommons-Form-multifieldset-add"
            ng-click="form.checksum.excludeNodeTypes.push({ value: '' });">
        <i class="coral-Icon coral-Icon--add"></i>
    </button>
</section>


<%-- Exclude Properties --%>
<section class="coral-Form-fieldset acsCommons-Form-multifieldset">
    <h3 class="coral-Form-fieldset-legend">Properties to exclude</h3>

    <div ng-repeat="item in form.checksum.excludeProperties track by $index">
        <button class="coral-Button coral-Button--square coral-Button--quiet acsCommons-Form-multifieldset-remove"
                ng-click="form.checksum.excludeProperties.splice($index, 1)">
            <i class="coral-Icon coral-Icon--delete"></i>
        </button>


        <input class="coral-Form-field coral-Textfield acsCommons-Form-multifieldset-input"
               ng-model="item.value"
               type="text"
               placeholder="Property to exclude"/>
    </div>

    <a  class="acsCommons-Form-multifieldset-add coral-Icon coral-Icon--addCircle"
        ng-click="form.checksum.excludeProperties.push({ value: '' });">Add Property to Exclude</a>
</section>


<%-- Sorted Properties --%>
<section class="coral-Form-fieldset acsCommons-Form-multifieldset">
    <h3 class="coral-Form-fieldset-legend">Sorted multi-value properties</h3>

    <div ng-repeat="item in form.checksum.sortedProperties track by $index">
        <button class="coral-Button coral-Button--square coral-Button--quiet acsCommons-Form-multifieldset-remove"
                ng-click="form.checksum.sortedProperties.splice($index, 1)">
            <i class="coral-Icon coral-Icon--delete"></i>
        </button>


        <input class="coral-Form-field coral-Textfield acsCommons-Form-multifieldset-input"
               ng-model="item.value"
               type="text"
               placeholder="Property to respect sort order of values"/>
    </div>

    <a  class="acsCommons-Form-multifieldset-add coral-Icon coral-Icon--addCircle"
        ng-click="form.checksum.sortedProperties.push({ value: '' });">Add Sorted Property</a>
</section>


<%-- Comparison --%>

<section class="coral-Form-fieldset">
    <div class="coral-Form-fieldwrapper">
        <label class="coral-Form-fieldlabel">Left</label>

        <select ng-model="diff.left"
                ng-options="host as host.name for host in hosts"></select>
    </div>


    <div class="coral-Form-fieldwrapper">
        <label class="coral-Form-fieldlabel">Right</label>

        <select ng-model="diff.right"
                ng-options="host as host.name for host in hosts"></select>
    </div>
</section>

<button type="submit"
        role="button"
        ng-hide="!diff.left || !diff.right || app.running"
        ng-click="compare()"
        class="coral-Button coral-Button--primary">Compare</button>

<p></p>

<div diff
     inline="true"
     base-data="diff.left"
     new-data="diff.right"></div>