# reflex-aws-config-rule-deleted
A Reflex rule for detecting when AWS Config Rules get deleted.

## Usage
To use this rule either add it to your `reflex.yaml` configuration file:  
```
rules:
  - reflex-aws-config-rule-deleted:
      email: "example@example.com"
```

or add it directly to your Terraform:  
```
...

module "reflex-aws-config-rule-deleted" {
  source           = "github.com/cloudmitigator/reflex-aws-config-rule-deleted"
  email            = "example@example.com"
}

...
```

## License
This Reflex rule is made available under the MPL 2.0 license. For more information view the [LICENSE](https://github.com/cloudmitigator/reflex-aws-config-rule-deleted/blob/master/LICENSE)
